/* user and group to drop privileges to */
static const char *user  = "upal";
static const char *group = "upal";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "#282828",     /* after initialization */
	[INPUT] =  "#89b482",   /* during input */
	[FAILED] = "#ea6962",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;
