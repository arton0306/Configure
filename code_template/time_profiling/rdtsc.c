#include <stdio.h>
#include <unistd.h>

int main()
{
        unsigned long long val1;
        unsigned long long val2;

        val1 = __builtin_ia32_rdtsc();
        sleep(1);
        val2 = __builtin_ia32_rdtsc();

        printf ("ts1: %lld\n", (val1));
        printf ("ts2: %lld\n", (val2));
        printf ("diff: %lld\n", val2-val1);

        return (0);
}

