#include <stdio.h>
#include <unistd.h>
#include <time.h>

int main()
{
    unsigned long long val1;
    unsigned long long val2;

    struct timespec t1,t2;
    clock_gettime(CLOCK_REALTIME, &t1);
    val1 = __builtin_ia32_rdtsc();
    sleep(1);
    val2 = __builtin_ia32_rdtsc();
    clock_gettime(CLOCK_REALTIME, &t2);

    printf ("ts1: %lld\n", (val1));
    printf ("ts2: %lld\n", (val2));
    printf ("diff in Hz: %lld\n", val2-val1);

    const double rdtsc_diff_sec = (val2-val1)/3.4;
    const double clock_gettime_diff_sec =
        t2.tv_sec - t1.tv_sec +
        (t2.tv_nsec - t1.tv_nsec) / 1000000000.0;

    printf ("diff in sec: %lf\n", rdtsc_diff_sec);
    printf ("diff clock_gettime in sec: %lf\n", clock_gettime_diff_sec);
    if (rdtsc_diff_sec > clock_gettime_diff_sec) {
        printf ("not expected ... :(\n");
    }

    return 0;
}
