// ref: https://man7.org/linux/man-pages/man2/clock_gettime.2.html

/* clock_times.c
   Licensed under GNU General Public License v2 or later.
*/
#define _XOPEN_SOURCE 600
#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <unistd.h>

#define SECS_IN_DAY (24 * 60 * 60)

static void
displayClock(clockid_t clock, const char *name, bool showRes)
{
    struct timespec ts;

    if (clock_gettime(clock, &ts) == -1) {
	perror("clock_gettime");
	exit(EXIT_FAILURE);
    }

    printf("%-25s: %10ld.%03ld (", name,
	    (long) ts.tv_sec, ts.tv_nsec / 1000000);

    long days = ts.tv_sec / SECS_IN_DAY;
    if (days > 0)
	printf("%ld days + ", days);

    printf("%2ldh %2ldm %2lds", (ts.tv_sec % SECS_IN_DAY) / 3600,
	    (ts.tv_sec % 3600) / 60, ts.tv_sec % 60);
    printf(")\n");

    if (clock_getres(clock, &ts) == -1) {
	perror("clock_getres");
	exit(EXIT_FAILURE);
    }

    if (showRes)
	printf("%-25s: %1ld.%09ld\n",
                " resolution",
		(long) ts.tv_sec, ts.tv_nsec);
}

int
main(int argc, char *argv[])
{
    bool showRes = true;

    displayClock(CLOCK_REALTIME, "CLOCK_REALTIME", showRes);
    displayClock(CLOCK_MONOTONIC, "CLOCK_MONOTONIC", showRes);
    displayClock(CLOCK_PROCESS_CPUTIME_ID, "CLOCK_PROCESS_CPUTIME_ID", showRes);

    // displayClock(CLOCK_TAI, "CLOCK_TAI", showRes);
    // displayClock(CLOCK_BOOTTIME, "CLOCK_BOOTTIME", showRes);

    exit(EXIT_SUCCESS);
}
