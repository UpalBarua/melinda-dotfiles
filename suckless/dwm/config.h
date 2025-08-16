/* APPEARANCE */
static const unsigned int borderpx = 2; /* border pixel of windows */
static const unsigned int gappx = 5;    /* gaps between windows */
static const unsigned int snap = 32;    /* snap pixel */
static const int showbar = 1;           /* 0 means no bar */
static const int topbar = 1;            /* 0 means bottom bar */
static const int horizpadbar = 0;       /* horizontal padding for statusbar */
static const int vertpadbar = 16;       /* vertical padding for statusbar */

/* fonts */
static const char *fonts[] = {
    "GeistMonoNerdFontPropo:size=10",
    "icomoon\\-feather:size=10",
    "JoyPixels:size=14",
};

/* colorscheme (tokyonight) */
static const char background[] = "#282828";
static const char foreground[] = "#ebdbb2";
static const char primary[] = "#d79921";
static const char muted[] = "#3C3836";

static const char *colors[][3] = {
    /*               fg         bg         border   */
    [SchemeNorm] = {foreground, background, muted},
    [SchemeSel] = {background, primary, primary},
};

/* tagging */
static const char *tags[] = {"一", "に", "三", "四", "五", "六", "七", "八"};

/* window rules */
static const Rule rules[] = {
    /* xprop(1):
     *	WM_CLASS(STRING) = instance, class
     *	WM_NAME(STRING) = title
     */
    /* class      instance    title       tags mask     isfloating   monitor */
    {"Brave-browser", NULL, NULL, 2, 0, -1},
    {"VSCodium", NULL, NULL, 1, 0, -1},
    {"obsidian", NULL, NULL, 4, 0, -1},
    {"Galculator", NULL, NULL, 0, 1, -1},
    {"Gpick", NULL, NULL, 0, 1, -1},
    {"Tk", NULL, NULL, 0, 1, -1},
    {"Scratchpad", NULL, NULL, 0, 1, -1},
};

/* layout(s) */
static const float mfact = 0.5; /* factor of master area size [0.05..0.95] */
static const int nmaster = 1;   /* number of clients in master area */
static const int resizehints =
    0; /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen =
    1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
    /* symbol     arrange function */
    {"  Tiling ", tile},   /* first entry is default */
    {"  Floating ", NULL}, /* no layout function means floating behavior */
    {"  Monocole ", monocle},
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY, TAG)                                                      \
  {MODKEY, KEY, view, {.ui = 1 << TAG}},                                       \
      {MODKEY | ControlMask, KEY, toggleview, {.ui = 1 << TAG}},               \
      {MODKEY | ShiftMask, KEY, tag, {.ui = 1 << TAG}},                        \
      {MODKEY | ControlMask | ShiftMask, KEY, toggletag, {.ui = 1 << TAG}},

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd)                                                             \
  {                                                                            \
    .v = (const char *[]) { "/bin/sh", "-c", cmd, NULL }                       \
  }

/* commands */
static char dmenumon[2] = "0";
static const char *dmenucmd[] = {"rofi", "-show", "drun", NULL};
static const char *termcmd[] = {"alacritty", NULL};

#include "movestack.c"
static const Key keys[] = {
    /* modifier                     key        function        argument */
    // DWM controls
    {MODKEY, XK_p, spawn, SHCMD("rofi -show drun -show-icons")},
    {MODKEY, XK_r, spawn, SHCMD("rofi -show run")},
    {MODKEY, XK_Return, spawn, SHCMD("$TERMINAL")},
    {MODKEY, XK_BackSpace, spawn,
     SHCMD("tdrop -a -w 1400 -h 80% -x -0 -y -0 $TERMINAL "
           "--class=Scratchpad")},
    {MODKEY, XK_b, togglebar, {0}},
    {MODKEY, XK_j, focusstack, {.i = +1}},
    {MODKEY, XK_k, focusstack, {.i = -1}},
    {MODKEY, XK_i, incnmaster, {.i = +1}},
    {MODKEY, XK_d, incnmaster, {.i = -1}},
    {MODKEY, XK_h, setmfact, {.f = -0.05}},
    {MODKEY, XK_l, setmfact, {.f = +0.05}},
    {MODKEY | ShiftMask, XK_j, movestack, {.i = +1}},
    {MODKEY | ShiftMask, XK_k, movestack, {.i = -1}},
    {MODKEY | ShiftMask, XK_Return, zoom, {0}},
    {MODKEY, XK_Tab, view, {0}},
    {MODKEY | ShiftMask, XK_q, killclient, {0}},
    {MODKEY, XK_t, setlayout, {.v = &layouts[0]}},
    {MODKEY, XK_f, setlayout, {.v = &layouts[1]}},
    {MODKEY, XK_m, setlayout, {.v = &layouts[2]}},
    {MODKEY, XK_space, setlayout, {0}},
    {MODKEY | ShiftMask, XK_space, togglefloating, {0}},
    {MODKEY, XK_0, view, {.ui = ~0}},
    {MODKEY | ShiftMask, XK_0, tag, {.ui = ~0}},
    {MODKEY, XK_comma, focusmon, {.i = -1}},
    {MODKEY, XK_period, focusmon, {.i = +1}},
    {MODKEY | ShiftMask, XK_comma, tagmon, {.i = -1}},
    {MODKEY | ShiftMask, XK_period, tagmon, {.i = +1}},
    {MODKEY, XK_minus, setgaps, {.i = -1}},
    {MODKEY, XK_equal, setgaps, {.i = +1}},
    {MODKEY | ShiftMask, XK_equal, setgaps, {.i = 0}},

    // GUI applications
    {MODKEY | Mod1Mask, XK_b, spawn, SHCMD("$BROWSER")},
    {MODKEY | Mod1Mask, XK_v, spawn, SHCMD("vscodium")},
    {MODKEY | Mod1Mask, XK_t, spawn, SHCMD("thunar")},
    {MODKEY | Mod1Mask, XK_o, spawn, SHCMD("obsidian")},
    {MODKEY | Mod1Mask, XK_f, spawn, SHCMD("$TERMINAL -e lfub")},

    // Rofi
    {MODKEY, XK_e, spawn, SHCMD("rofi -show emoji -modi emoji")},
    {MODKEY, XK_c, spawn,
     SHCMD("rofi -show calc -modi calc -no-show-match -no-sort")},
    {MODKEY, XK_v, spawn,
     SHCMD("rofi -modi 'clipboard:greenclip print' -show clipboard "
           "-run-command '{cmd}'")},
    {MODKEY | ShiftMask, XK_t, spawn, SHCMD("rofi-quick-toggles.sh")},
    {MODKEY | ShiftMask, XK_r, spawn, SHCMD("rofi-beats.sh")},

    // System controls
    {Mod1Mask, XK_F1, spawn, SHCMD("volume.sh -m")},
    {Mod1Mask, XK_F2, spawn, SHCMD("volume.sh -d")},
    {Mod1Mask, XK_F3, spawn, SHCMD("volume.sh -i")},
    {Mod1Mask, XK_F11, spawn, SHCMD("brightness.sh -d")},
    {Mod1Mask, XK_F12, spawn, SHCMD("brightness.sh -i")},
    {MODKEY, XK_Escape, spawn, SHCMD("rofi-session.sh")},

    // Utilities
    {Mod1Mask, XK_F5, spawn, SHCMD("random-bg.sh")},
    {0, XK_Print, spawn,
     SHCMD("flameshot & flameshot screen -p ~/pictures/screenshots/ "
           "--clipboard")},
    {ShiftMask, XK_Print, spawn,
     SHCMD("flameshot & flameshot gui -p ~/pictures/screenshots/ "
           "--clipboard")},

    TAGKEYS(XK_1, 0) TAGKEYS(XK_2, 1) TAGKEYS(XK_3, 2) TAGKEYS(XK_4, 3)
        TAGKEYS(XK_5, 4) TAGKEYS(XK_6, 5) TAGKEYS(XK_7, 6) TAGKEYS(XK_8, 7)
            TAGKEYS(XK_9, 8)};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle,
 * ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
    /* click                event mask      button          function argument */
    {ClkLtSymbol, 0, Button1, setlayout, {0}},
    {ClkLtSymbol, 0, Button3, setlayout, {.v = &layouts[2]}},
    {ClkStatusText, 0, Button2, spawn, {.v = termcmd}},
    {ClkClientWin, MODKEY, Button1, movemouse, {0}},
    {ClkClientWin, MODKEY, Button2, togglefloating, {0}},
    {ClkClientWin, MODKEY, Button3, resizemouse, {0}},
    {ClkTagBar, 0, Button1, view, {0}},
    {ClkTagBar, 0, Button3, toggleview, {0}},
    {ClkTagBar, MODKEY, Button1, tag, {0}},
    {ClkTagBar, MODKEY, Button3, toggletag, {0}},
};
