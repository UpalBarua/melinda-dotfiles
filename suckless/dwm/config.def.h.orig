/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int gappx     = 5;        /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int horizpadbar        = 0;        /* horizontal padding for statusbar */
static const int vertpadbar         = 15;        /* vertical padding for statusbar */
static const char *fonts[]          = {
    "UbuntuMono Nerd Font:size=12:antialias=true:hinting=true"
    "JetBrainsMonoNerdFont:size=12:antialias=true:autohint=true",
    "icomoon\\-feather:size=12:antialias=true:autohint=true",
    "JoyPixels:size=14:antialias=true:autohint=true",
 };
static const char col_gray1[]       = "#282828";
static const char col_gray2[]       = "#928374";
static const char col_gray3[]       = "#d4be98";
static const char col_gray4[]       = "#282828";
static const char col_cyan[]        = "#89b482";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6"};

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
  { "Brave-browser", NULL, NULL, 2, 0, -1},
  { "VSCodium", NULL, NULL, 1, 0, -1},
  { "obsidian", NULL, NULL, 4, 0, -1},
  { "Galculator", NULL, NULL, 0, 1, -1},
};

/* layout(s) */
static const float mfact     = 0.5; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = {"dmenu_run", "-p", "run ", NULL};
static const char *termcmd[]  = { "alacritty", NULL };

#include "movestack.c"
static const Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_j,      movestack,      {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_k,      movestack,      {.i = -1 } },
	{ MODKEY|ShiftMask,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODKEY,                       XK_minus,  setgaps,        {.i = -1 } },
	{ MODKEY,                       XK_equal,  setgaps,        {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_equal,  setgaps,        {.i = 0  } },
  { MODKEY|Mod1Mask,              XK_b,      spawn,          SHCMD("$BROWSER") },
	{ MODKEY|Mod1Mask,              XK_v,      spawn,          SHCMD("vscodium") },
	{ MODKEY|Mod1Mask,              XK_x,      spawn,          SHCMD("firefox") },
	{ MODKEY|Mod1Mask,              XK_c,      spawn,          SHCMD("gpick") },
	{ MODKEY|Mod1Mask,              XK_t,      spawn,          SHCMD("pcmanfm") },
	{ MODKEY|Mod1Mask,              XK_o,      spawn,          SHCMD("obsidian") },
	{ MODKEY|ControlMask,           XK_b,      spawn,          SHCMD("blueberry") },
	{ MODKEY|Mod1Mask,              XK_i,      spawn,          SHCMD("timeshift-launcher") },
	{ MODKEY|Mod1Mask,              XK_p,      spawn,          SHCMD("postman") },
	{ MODKEY|Mod1Mask,              XK_y,      spawn,          SHCMD("$TERMINAL -e btop") },
	{ MODKEY|Mod1Mask,              XK_z,      spawn,          SHCMD("$TERMINAL -e htop") },
	{ MODKEY|Mod1Mask,              XK_f,      spawn,          SHCMD("$TERMINAL -e lfub") },
	{ MODKEY,                       XK_r,      spawn,          {.v = dmenucmd} },
	{ MODKEY,                       XK_b,      spawn,          SHCMD("dm-bluetooth") },
	{ MODKEY,                       XK_w,      spawn,          SHCMD("dm-wifi") },
	{ MODKEY,                       XK_e,      spawn,          SHCMD("bemoji") },
	{ MODKEY,                       XK_c,      spawn,          SHCMD("galculator") },
	{ MODKEY,                       XK_v,      spawn,          SHCMD("clipmenu") },
	{ Mod1Mask,                     XK_F1,     spawn,          SHCMD("pamixer --toggle-mute; dunstify -r 3456 -t 2000 \"🔉 System Volume $(pamixer --get-volume)%\"; kill -$((34+10)) $(pidof dwmblocks)") },
	{ Mod1Mask,                     XK_F2,     spawn,          SHCMD("pamixer -d 2; dunstify -r 3456 -t 2000 \"🔉 System Volume $(pamixer --get-volume)%\"; kill -$((34+10)) $(pidof dwmblocks)") },
	{ Mod1Mask,                     XK_F3,     spawn,          SHCMD("pamixer -i 2; dunstify -r 3456 -t 2000 \"🔉 System Volume $(pamixer --get-volume)%\"; kill -$((34+10)) $(pidof dwmblocks)") },
	{ Mod1Mask,                     XK_F11,    spawn,          SHCMD("[ $(brightnessctl g) -gt 17 ] && brightnessctl set 2%-; dunstify -r 6789 -t 2000 \"💡 System Brightness $(brightnessctl | grep \"Current\" | awk -F'[()]' '{print $2}' | sed 's/%//g')%\"; kill -$((34+11)) $(pidof dwmblocks)") },
	{ Mod1Mask,                     XK_F12,    spawn,          SHCMD("brightnessctl set +2%; dunstify -r 6789 -t 2000 \"💡 System Brightness $(brightnessctl | grep \"Current\" | awk -F'[()]' '{print $2}' | sed 's/%//g')%\"; kill -$((34+11)) $(pidof dwmblocks)") },
	{ Mod1Mask,                     XK_F5,     spawn,          SHCMD("feh --recursive --bg-fill --randomize $HOME/Pictures/wallpapers") },
	{ 0,                            XK_Print,   spawn,          SHCMD("disown & flameshot & flameshot screen -p ~/Pictures/screenshots/ --clipboard") },
	{ ShiftMask,                    XK_Print,   spawn,          SHCMD("disown & flameshot & flameshot gui -p ~/Pictures/screenshots/ --clipboard") },
	{ MODKEY|Mod1Mask|ControlMask,  XK_q,       quit,           {0} },
	{ MODKEY|Mod1Mask|ControlMask,  XK_p,       spawn,          SHCMD("systemctl poweroff") },
	{ MODKEY|Mod1Mask|ControlMask,  XK_r,       spawn,          SHCMD("systemctl reboot") },
	{ MODKEY|Mod1Mask|ControlMask,  XK_s,       spawn,          SHCMD("systemctl suspend") },
	{ MODKEY|Mod1Mask|ControlMask,  XK_l,       spawn,          SHCMD("slock") },
  { MODKEY,                       XK_q,       spawn,          SHCMD("dm-session") },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

