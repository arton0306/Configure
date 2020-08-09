#include <cstdio>
#include <ctime>
#include <cstdint>
#include <chrono>

using namespace std;

void test_clock_gettime() {
    struct timespec temp;
    clock_gettime(CLOCK_REALTIME, &temp);
}

void test_rdtsc() {
    __builtin_ia32_rdtsc();
}

void test_std_chrono() {
    using namespace std::chrono;
    high_resolution_clock::time_point t1 = high_resolution_clock::now();
}

int main() {

    const uint64_t sample_count = 1000000;

    struct timespec out1, out2;
    clock_gettime(CLOCK_REALTIME, &out1);
    {
        void (*func)();

        if (0) { // test clock_gettime
            func = test_clock_gettime;
            for (unsigned i = 0; i < sample_count; ++i) {
                func();
            }
        }

        if (0) { // test rdtsc
            func = test_rdtsc;
            for (unsigned i = 0; i < sample_count; ++i) {
                func();
            }
        }

        if (1) { // test c++ chrono
            func = test_std_chrono;
            for (unsigned i = 0; i < sample_count; ++i) {
                func();
            }
        }
    }
    clock_gettime(CLOCK_REALTIME, &out2);

    uint64_t elapsed_ns = out2.tv_nsec - out1.tv_nsec;
    printf("%10llu ns for %8llu calls, %6.2lf ns per one call in average\n",
           elapsed_ns,
           sample_count,
           (double)elapsed_ns / (double)sample_count);

    return 0;
}

