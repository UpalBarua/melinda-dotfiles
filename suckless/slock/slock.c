/* See LICENSE file for license details. */
#define _XOPEN_SOURCE 500
#if HAVE_SHADOW_H
#include <shadow.h>
#endif

#include <Imlib2.h>
#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/extensions/Xinerama.h>
#include <X11/extensions/Xrandr.h>
#include <X11/keysym.h>
#include <cairo/cairo-xlib.h>
#include <ctype.h>
#include <errno.h>
#include <grp.h>
#include <pwd.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <unistd.h>

#include "arg.h"
#include "util.h"
#include <pthread.h>
#include <time.h>

char *argv0;

/* global count to prevent repeated error messages */
int count_error = 0;

enum { INIT, INPUT, FAILED, NUMCOLS };

struct lock {
  int screen;
  Window root, win;
  Pixmap pmap;
  Pixmap bgmap;
  unsigned long colors[NUMCOLS];
};

struct xrandr {
  int active;
  int evbase;
  int errbase;
};

struct displayData {
  struct lock **locks;
  Display *dpy;
  int nscreens;
  cairo_t **crs;
  cairo_surface_t **surfaces;
};
static pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
#include "config.h"

Imlib_Image image;

static void die(const char *errstr, ...) {
  va_list ap;

  va_start(ap, errstr);
  vfprintf(stderr, errstr, ap);
  va_end(ap);
  exit(1);
}

#ifdef __linux__
#include <fcntl.h>
#include <linux/oom.h>

static void dontkillme(void) {
  FILE *f;
  const char oomfile[] = "/proc/self/oom_score_adj";

  if (!(f = fopen(oomfile, "w"))) {
    if (errno == ENOENT)
      return;
    die("slock: fopen %s: %s\n", oomfile, strerror(errno));
  }
  fprintf(f, "%d", OOM_SCORE_ADJ_MIN);
  if (fclose(f)) {
    if (errno == EACCES)
      die("slock: unable to disable OOM killer. "
          "Make sure to suid or sgid slock.\n");
    else
      die("slock: fclose %s: %s\n", oomfile, strerror(errno));
  }
}
#endif

static void writemessage(Display *dpy, Window win, int screen) {
  int len, line_len, width, height, s_width, s_height, i, j, k, tab_replace,
      tab_size;
  XGCValues gr_values;
  XFontStruct *fontinfo;
  XColor color, dummy;
  XineramaScreenInfo *xsi;
  GC gc;
  fontinfo = XLoadQueryFont(dpy, font_name);

  if (fontinfo == NULL) {
    if (count_error == 0) {
      fprintf(stderr, "slock: Unable to load font \"%s\"\n", font_name);
      fprintf(stderr, "slock: Try listing fonts with 'slock -f'\n");
      count_error++;
    }
    return;
  }

  tab_size = 8 * XTextWidth(fontinfo, " ", 1);

  XAllocNamedColor(dpy, DefaultColormap(dpy, screen), text_color, &color,
                   &dummy);

  gr_values.font = fontinfo->fid;
  gr_values.foreground = color.pixel;
  gc = XCreateGC(dpy, win, GCFont + GCForeground, &gr_values);

  /*  To prevent "Uninitialized" warnings. */
  xsi = NULL;

  /*
   * Start formatting and drawing text
   */

  len = strlen(message);

  /* Max max line length (cut at '\n') */
  line_len = 0;
  k = 0;
  for (i = j = 0; i < len; i++) {
    if (message[i] == '\n') {
      if (i - j > line_len)
        line_len = i - j;
      k++;
      i++;
      j = i;
    }
  }
  /* If there is only one line */
  if (line_len == 0)
    line_len = len;

  if (XineramaIsActive(dpy)) {
    xsi = XineramaQueryScreens(dpy, &i);
    s_width = xsi[0].width;
    s_height = xsi[0].height;
  } else {
    s_width = DisplayWidth(dpy, screen);
    s_height = DisplayHeight(dpy, screen);
  }

  height = s_height * 3 / 7 - (k * 20) / 3;
  width = (s_width - XTextWidth(fontinfo, message, line_len)) / 2;

  /* Look for '\n' and print the text between them. */
  for (i = j = k = 0; i <= len; i++) {
    /* i == len is the special case for the last line */
    if (i == len || message[i] == '\n') {
      tab_replace = 0;
      while (message[j] == '\t' && j < i) {
        tab_replace++;
        j++;
      }

      XDrawString(dpy, win, gc, width + tab_size * tab_replace, height + 20 * k,
                  message + j, i - j);
      while (i < len && message[i] == '\n') {
        i++;
        j = i;
        k++;
      }
    }
  }

  /* xsi should not be NULL anyway if Xinerama is active, but to be safe */
  if (XineramaIsActive(dpy) && xsi != NULL)
    XFree(xsi);
}

static const char *gethash(void) {
  const char *hash;
  struct passwd *pw;

  /* Check if the current user has a password entry */
  errno = 0;
  if (!(pw = getpwuid(getuid()))) {
    if (errno)
      die("slock: getpwuid: %s\n", strerror(errno));
    else
      die("slock: cannot retrieve password entry\n");
  }
  hash = pw->pw_passwd;

#if HAVE_SHADOW_H
  if (!strcmp(hash, "x")) {
    struct spwd *sp;
    if (!(sp = getspnam(pw->pw_name)))
      die("slock: getspnam: cannot retrieve shadow entry. "
          "Make sure to suid or sgid slock.\n");
    hash = sp->sp_pwdp;
  }
#else
  if (!strcmp(hash, "*")) {
#ifdef __OpenBSD__
    if (!(pw = getpwuid_shadow(getuid())))
      die("slock: getpwnam_shadow: cannot retrieve shadow entry. "
          "Make sure to suid or sgid slock.\n");
    hash = pw->pw_passwd;
#else
    die("slock: getpwuid: cannot retrieve shadow entry. "
        "Make sure to suid or sgid slock.\n");
#endif /* __OpenBSD__ */
  }
#endif /* HAVE_SHADOW_H */

  return hash;
}
static void
refresh(Display *dpy, Window win, int screen, struct tm time, cairo_t *cr,
        cairo_surface_t
            *sfc) { /*Function that displays given time on the given screen*/
  static char tm[24] = "";
  int xpos, ypos;
  xpos = DisplayWidth(dpy, screen) / 4;
  ypos = DisplayHeight(dpy, screen) / 2;
  sprintf(tm, "%02d/%02d/%d %02d:%02d", time.tm_mday, time.tm_mon + 1,
          time.tm_year + 1900, time.tm_hour, time.tm_min);
  XClearWindow(dpy, win);
  cairo_set_source_rgb(cr, textcolorred, textcolorgreen, textcolorblue);
  cairo_select_font_face(cr, textfamily, CAIRO_FONT_SLANT_NORMAL,
                         CAIRO_FONT_WEIGHT_BOLD);
  cairo_set_font_size(cr, textsize);
  cairo_move_to(cr, xpos, ypos);
  cairo_show_text(cr, tm);
  cairo_surface_flush(sfc);
  XFlush(dpy);
}
static void *displayTime(void *input) { /*Thread that keeps track of time and
                                           refreshes it every 5 seconds */
  struct displayData *displayData = (struct displayData *)input;
  while (1) {
    pthread_mutex_lock(&mutex); /*Mutex to prevent interference with refreshing
                                   screen while typing password*/
    time_t rawtime;
    time(&rawtime);
    struct tm tm = *localtime(&rawtime);
    for (int k = 0; k < displayData->nscreens; k++) {
      refresh(displayData->dpy, displayData->locks[k]->win,
              displayData->locks[k]->screen, tm, displayData->crs[k],
              displayData->surfaces[k]);
    }
    pthread_mutex_unlock(&mutex);
    sleep(5);
  }
  return NULL;
}

static void readpw(Display *dpy, struct xrandr *rr, struct lock **locks,
                   int nscreens, const char *hash, cairo_t **crs,
                   cairo_surface_t **surfaces) {
  XRRScreenChangeNotifyEvent *rre;
  char buf[32], passwd[256], *inputhash;
  int num, screen, running, failure, oldc;
  unsigned int len, color;
  KeySym ksym;
  XEvent ev;

  len = 0;
  running = 1;
  failure = 0;
  oldc = INIT;

  while (running && !XNextEvent(dpy, &ev)) {
    if (ev.type == KeyPress) {
      explicit_bzero(&buf, sizeof(buf));
      num = XLookupString(&ev.xkey, buf, sizeof(buf), &ksym, 0);
      if (IsKeypadKey(ksym)) {
        if (ksym == XK_KP_Enter)
          ksym = XK_Return;
        else if (ksym >= XK_KP_0 && ksym <= XK_KP_9)
          ksym = (ksym - XK_KP_0) + XK_0;
      }
      if (IsFunctionKey(ksym) || IsKeypadKey(ksym) || IsMiscFunctionKey(ksym) ||
          IsPFKey(ksym) || IsPrivateKeypadKey(ksym))
        continue;
      switch (ksym) {
      case XK_Return:
        passwd[len] = '\0';
        errno = 0;
        if (!(inputhash = crypt(passwd, hash)))
          fprintf(stderr, "slock: crypt: %s\n", strerror(errno));
        else
          running = !!strcmp(inputhash, hash);
        if (running) {
          XBell(dpy, 100);
          failure = 1;
        }
        explicit_bzero(&passwd, sizeof(passwd));
        len = 0;
        break;
      case XK_Escape:
        explicit_bzero(&passwd, sizeof(passwd));
        len = 0;
        break;
      case XK_BackSpace:
        if (len)
          passwd[--len] = '\0';
        break;
      default:
        if (num && !iscntrl((int)buf[0]) && (len + num < sizeof(passwd))) {
          memcpy(passwd + len, buf, num);
          len += num;
        }
        break;
      }
      color = len ? INPUT : ((failure || failonclear) ? FAILED : INIT);
      if (running && oldc != color) {
        pthread_mutex_lock(
            &mutex); /*Stop the time refresh thread from interfering*/
        for (screen = 0; screen < nscreens; screen++) {
          if (locks[screen]->bgmap)
            XSetWindowBackgroundPixmap(dpy, locks[screen]->win,
                                       locks[screen]->bgmap);
          else
            XSetWindowBackground(dpy, locks[screen]->win,
                                 locks[screen]->colors[0]);
          XClearWindow(dpy, locks[screen]->win);
          writemessage(dpy, locks[screen]->win, screen);

          time_t rawtime;
          time(&rawtime);
          refresh(dpy, locks[screen]->win, locks[screen]->screen,
                  *localtime(&rawtime), crs[screen], surfaces[screen]);
          /*Redraw the time after screen cleared*/
        }
        pthread_mutex_unlock(&mutex);
        oldc = color;
      }
    } else if (rr->active && ev.type == rr->evbase + RRScreenChangeNotify) {
      rre = (XRRScreenChangeNotifyEvent *)&ev;
      pthread_mutex_lock(
          &mutex); /*Stop the time refresh thread from interfering.*/
      for (screen = 0; screen < nscreens; screen++) {
        if (locks[screen]->win == rre->window) {
          if (rre->rotation == RR_Rotate_90 || rre->rotation == RR_Rotate_270)
            XResizeWindow(dpy, locks[screen]->win, rre->height, rre->width);
          else
            XResizeWindow(dpy, locks[screen]->win, rre->width, rre->height);
          XClearWindow(dpy, locks[screen]->win);
          break;
        }
      }

      pthread_mutex_unlock(&mutex);
    } else {
      for (screen = 0; screen < nscreens; screen++)
        XRaiseWindow(dpy, locks[screen]->win);
    }
  }
}

static struct lock *lockscreen(Display *dpy, struct xrandr *rr, int screen) {
  char curs[] = {0, 0, 0, 0, 0, 0, 0, 0};
  int i, ptgrab, kbgrab;
  struct lock *lock;
  XColor color, dummy;
  XSetWindowAttributes wa;
  Cursor invisible;

  if (dpy == NULL || screen < 0 || !(lock = malloc(sizeof(struct lock))))
    return NULL;

  lock->screen = screen;
  lock->root = RootWindow(dpy, lock->screen);

  if (image) {
    lock->bgmap = XCreatePixmap(
        dpy, lock->root, DisplayWidth(dpy, lock->screen),
        DisplayHeight(dpy, lock->screen), DefaultDepth(dpy, lock->screen));
    imlib_context_set_image(image);
    imlib_context_set_display(dpy);
    imlib_context_set_visual(DefaultVisual(dpy, lock->screen));
    imlib_context_set_colormap(DefaultColormap(dpy, lock->screen));
    imlib_context_set_drawable(lock->bgmap);
    imlib_render_image_on_drawable(0, 0);
    imlib_free_image();
  }
  for (i = 0; i < NUMCOLS; i++) {
    XAllocNamedColor(dpy, DefaultColormap(dpy, lock->screen), colorname[i],
                     &color, &dummy);
    lock->colors[i] = color.pixel;
  }

  /* init */
  wa.override_redirect = 1;
  wa.background_pixel = lock->colors[INIT];
  lock->win = XCreateWindow(
      dpy, lock->root, 0, 0, DisplayWidth(dpy, lock->screen),
      DisplayHeight(dpy, lock->screen), 0, DefaultDepth(dpy, lock->screen),
      CopyFromParent, DefaultVisual(dpy, lock->screen),
      CWOverrideRedirect | CWBackPixel, &wa);
  if (lock->bgmap)
    XSetWindowBackgroundPixmap(dpy, lock->win, lock->bgmap);
  lock->pmap = XCreateBitmapFromData(dpy, lock->win, curs, 8, 8);
  invisible =
      XCreatePixmapCursor(dpy, lock->pmap, lock->pmap, &color, &color, 0, 0);
  XDefineCursor(dpy, lock->win, invisible);

  /* Try to grab mouse pointer *and* keyboard for 600ms, else fail the lock */
  for (i = 0, ptgrab = kbgrab = -1; i < 6; i++) {
    if (ptgrab != GrabSuccess) {
      ptgrab = XGrabPointer(
          dpy, lock->root, False,
          ButtonPressMask | ButtonReleaseMask | PointerMotionMask,
          GrabModeAsync, GrabModeAsync, None, invisible, CurrentTime);
    }
    if (kbgrab != GrabSuccess) {
      kbgrab = XGrabKeyboard(dpy, lock->root, True, GrabModeAsync,
                             GrabModeAsync, CurrentTime);
    }

    /* input is grabbed: we can lock the screen */
    if (ptgrab == GrabSuccess && kbgrab == GrabSuccess) {
      XMapRaised(dpy, lock->win);
      if (rr->active)
        XRRSelectInput(dpy, lock->win, RRScreenChangeNotifyMask);

      XSelectInput(dpy, lock->root, SubstructureNotifyMask);
      return lock;
    }

    /* retry on AlreadyGrabbed but fail on other errors */
    if ((ptgrab != AlreadyGrabbed && ptgrab != GrabSuccess) ||
        (kbgrab != AlreadyGrabbed && kbgrab != GrabSuccess))
      break;

    usleep(100000);
  }

  /* we couldn't grab all input: fail out */
  if (ptgrab != GrabSuccess)
    fprintf(stderr, "slock: unable to grab mouse pointer for screen %d\n",
            screen);
  if (kbgrab != GrabSuccess)
    fprintf(stderr, "slock: unable to grab keyboard for screen %d\n", screen);
  return NULL;
}

static void usage(void) {
  die("usage: slock [-v] [-f] [-m message] [cmd [arg ...]]\n");
}

int main(int argc, char **argv) {
  struct xrandr rr;
  struct lock **locks;
  struct passwd *pwd;
  struct group *grp;
  uid_t duid;
  gid_t dgid;
  const char *hash;
  Display *dpy;
  int i, s, nlocks, nscreens;
  int count_fonts;
  char **font_names;

  ARGBEGIN {
  case 'v':
    puts("slock-" VERSION);
    return 0;
  case 'm':
    message = EARGF(usage());
    break;
  case 'f':
    if (!(dpy = XOpenDisplay(NULL)))
      die("slock: cannot open display\n");
    font_names =
        XListFonts(dpy, "*", 10000 /* list 10000 fonts*/, &count_fonts);
    for (i = 0; i < count_fonts; i++) {
      fprintf(stderr, "%s\n", *(font_names + i));
    }
    return 0;
  default:
    usage();
  }
  ARGEND

  /* validate drop-user and -group */
  errno = 0;
  if (!(pwd = getpwnam(user)))
    die("slock: getpwnam %s: %s\n", user,
        errno ? strerror(errno) : "user entry not found");
  duid = pwd->pw_uid;
  errno = 0;
  if (!(grp = getgrnam(group)))
    die("slock: getgrnam %s: %s\n", group,
        errno ? strerror(errno) : "group entry not found");
  dgid = grp->gr_gid;

#ifdef __linux__
  dontkillme();
#endif

  hash = gethash();
  errno = 0;
  if (!crypt("", hash))
    die("slock: crypt: %s\n", strerror(errno));
  XInitThreads();
  if (!(dpy = XOpenDisplay(NULL)))
    die("slock: cannot open display\n");

  /* drop privileges */
  if (setgroups(0, NULL) < 0)
    die("slock: setgroups: %s\n", strerror(errno));
  if (setgid(dgid) < 0)
    die("slock: setgid: %s\n", strerror(errno));
  if (setuid(duid) < 0)
    die("slock: setuid: %s\n", strerror(errno));

  /*Create screenshot Image*/
  Screen *scr = ScreenOfDisplay(dpy, DefaultScreen(dpy));
  image = imlib_create_image(scr->width, scr->height);
  imlib_context_set_image(image);
  imlib_context_set_display(dpy);
  imlib_context_set_visual(DefaultVisual(dpy, 0));
  imlib_context_set_drawable(RootWindow(dpy, XScreenNumberOfScreen(scr)));
  imlib_copy_drawable_to_image(0, 0, 0, scr->width, scr->height, 0, 0, 1);

#ifdef BLUR

  /*Blur function*/
  imlib_image_blur(blurRadius);
#endif // BLUR

#ifdef PIXELATION
  /*Pixelation*/
  int width = scr->width;
  int height = scr->height;

  for (int y = 0; y < height; y += pixelSize) {
    for (int x = 0; x < width; x += pixelSize) {
      int red = 0;
      int green = 0;
      int blue = 0;

      Imlib_Color pixel;
      Imlib_Color *pp;
      pp = &pixel;
      for (int j = 0; j < pixelSize && j < height; j++) {
        for (int i = 0; i < pixelSize && i < width; i++) {
          imlib_image_query_pixel(x + i, y + j, pp);
          red += pixel.red;
          green += pixel.green;
          blue += pixel.blue;
        }
      }
      red /= (pixelSize * pixelSize);
      green /= (pixelSize * pixelSize);
      blue /= (pixelSize * pixelSize);
      imlib_context_set_color(red, green, blue, pixel.alpha);
      imlib_image_fill_rectangle(x, y, pixelSize, pixelSize);
      red = 0;
      green = 0;
      blue = 0;
    }
  }

#endif
  /* check for Xrandr support */
  rr.active = XRRQueryExtension(dpy, &rr.evbase, &rr.errbase);

  /* get number of screens in display "dpy" and blank them */
  nscreens = ScreenCount(dpy);
  if (!(locks = calloc(nscreens, sizeof(struct lock *))))
    die("slock: out of memory\n");
  for (nlocks = 0, s = 0; s < nscreens; s++) {
    if ((locks[s] = lockscreen(dpy, &rr, s)) != NULL) {
      writemessage(dpy, locks[s]->win, s);
      nlocks++;
    } else {
      break;
    }
  }
  XSync(dpy, 0);

  /* did we manage to lock everything? */
  if (nlocks != nscreens)
    return 1;

  /* run post-lock command */
  if (argc > 0) {
    switch (fork()) {
    case -1:
      die("slock: fork failed: %s\n", strerror(errno));
    case 0:
      if (close(ConnectionNumber(dpy)) < 0)
        die("slock: close: %s\n", strerror(errno));
      execvp(argv[0], argv);
      fprintf(stderr, "slock: execvp %s: %s\n", argv[0], strerror(errno));
      _exit(1);
    }
  }

  /* everything is now blank. Wait for the correct password */
  pthread_t thredid;
  /* Create Cairo drawables upon which the time will be shown. */
  struct displayData displayData;
  cairo_surface_t **surfaces;
  cairo_t **crs;
  if (!(surfaces = calloc(nscreens, sizeof(cairo_surface_t *)))) {
    die("Out of memory");
  }
  if (!(crs = calloc(nscreens, sizeof(cairo_t *)))) {
    die("Out of memory");
  }
  for (int k = 0; k < nscreens; k++) {
    Drawable win = locks[k]->win;
    int screen = locks[k]->screen;
    XMapWindow(dpy, win);
    surfaces[k] = cairo_xlib_surface_create(
        dpy, win, DefaultVisual(dpy, screen), DisplayWidth(dpy, screen),
        DisplayHeight(dpy, screen));
    crs[k] = cairo_create(surfaces[k]);
  }
  displayData.dpy = dpy;
  displayData.locks = locks;
  displayData.nscreens = nscreens;
  displayData.crs = crs;
  displayData.surfaces = surfaces;
  /*Start the thread that redraws time every 5 seconds*/
  pthread_create(&thredid, NULL, displayTime, &displayData);
  /*Wait for the password*/
  readpw(dpy, &rr, locks, nscreens, hash, crs, surfaces);

  return 0;
}
