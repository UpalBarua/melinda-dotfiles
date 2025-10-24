/* user and group to drop privileges to */
static const char *user = "upal";
static const char *group = "upal";

/*Font settings for the time text*/
static const float textsize = 64.0;
static const char *textfamily = "GeistMono Nerd Font";
static const double textcolorred = 235;
static const double textcolorgreen = 219;
static const double textcolorblue = 178;

static const char *colorname[NUMCOLS] = {
    [INIT] = "#1e1e2e",   /* after initialization */
    [INPUT] = "#313244",  /* during input */
    [FAILED] = "#c5c9c5", /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;
