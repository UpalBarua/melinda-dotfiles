//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
    /*Icon*/ /*Command*/ /*Update Interval*/ /*Update Signal*/
    {" ", "sb-cputemp", 5, -1},
    {" ", "sb-cpuusage", 1, -1},
    {" ", "sb-memusage", 1, -1},
    {" ", "sb-brightness", 0, 11},
    {" ", "sb-volume", 0, 10},
    {" ", "sb-netspeed", 1, -1},
    {" ", "sb-dual-battery", 60, -1},
    {" ", "sb-datetime", 1, -1},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim = ' ';
