static const Block blocks[] = {
    /*Icon*/ /*Command*/ /*Update Interval*/ /*Update Signal*/
    {" ", "sb-brightness", 0, 11},
    {"", "sb-volume", 0, 10},
    {"", "sb-netspeed", 5, 13},
    {"", "sb-dual-battery", 60, 12},
    {"^c#89b482^ ^d^", "date '+%a %b %d / %I:%M %p '", 60, 14},
};

static char delim[] = "  ";
static unsigned int delimLen = 5;
