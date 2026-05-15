// Modify this file to change what commands output to your statusbar, and
// recompile using the make command.
static const Block blocks[] = {
    /*Icon*/ /*Command*/ /*Update Interval*/ /*Update Signal*/
    {"  ", "~/.local/bin/dwmblocks/sb-cpuusage", 1, -1},
    {"  ", "~/.local/bin/dwmblocks/sb-memusage", 1, -1},
    {"  ", "~/.local/bin/dwmblocks/sb-brightness", 0, 11},
    {"  ", "~/.local/bin/dwmblocks/sb-volume", 0, 10},
    {"  ", "~/.local/bin/dwmblocks/sb-netspeed", 1, -1},
    {"  ", "~/.local/bin/dwmblocks/sb-dual-battery", 60, -1},
    {"  ", "~/.local/bin/dwmblocks/sb-datetime", 1, -1},
};

// sets delimeter between status commands. NULL character ('\0') means no
// delimeter.
static char delim = ' ';
