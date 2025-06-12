/* See LICENSE file for copyright and license details. */

/* interval between updates (in ms) */
const unsigned int interval = -1;

/* text to show if no value can be retrieved */
static const char unknown_str[] = "n/a";

/* maximum command output length */
#define CMDLEN 128

static const struct arg args[] = {
    /* function format argument turn signal */
    {run_command, "%s  ", "sb-brightness", 0, 11},
    {run_command, "%s  ", "sb-volume", 0, 10},
    {run_command, "%s  ", "sb-netspeed", 5, -1},
    {run_command, "%s  ", "sb-dual-battery", 60, -1},
    // {run_command, "%s  ", "sb-datetime", 60, -1},
    {run_command, "%s  ", "date", 60, -1},
};

/* maximum output string length */
#define MAXLEN CMDLEN *LEN(args)
