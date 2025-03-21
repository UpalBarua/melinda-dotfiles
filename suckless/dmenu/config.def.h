/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const int user_bh = 12;               /* add an defined amount of pixels to the bar height */

static const char *fonts[] = {
    "UbuntuMono Nerd Font:size=11:antialias=true:hinting=true",
    "JetBrainsMono Nerd Font:size=12:antialias=true:hinting=true"
    "ttf-joypixels:size=12:antialias=true:hinting=true"};

static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { "#d4be98", "#282828" },
	[SchemeSel] = { "#282828", "#89b482" },
	[SchemeOut] = { "#000000", "#00ffff" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
