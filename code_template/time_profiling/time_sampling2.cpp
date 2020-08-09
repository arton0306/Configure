#include <cstdio>
#include <ctime>
#include <cstdint>
#include <chrono>

using namespace std;

void test_clock_gettime_realtime() {
    struct timespec temp;
    clock_gettime(CLOCK_REALTIME, &temp);
}

void test_clock_gettime_monotonic() {
    struct timespec temp;
    clock_gettime(CLOCK_MONOTONIC, &temp);
}

void test_rdtsc() {
    __builtin_ia32_rdtsc();
}

void test_std_chrono() {
    using namespace std::chrono;
    high_resolution_clock::now();
}

// assume the total run time can be measured less than 1 sec (do not use too large sample_count)
// note that the resolution of clock_gettime might be 1000 ns
void profiling_wrapper(uint64_t sample_count, void (*func_under_test)(), const char *title) {
    struct timespec out1, out2;
    clock_gettime(CLOCK_REALTIME, &out1);
    {
        for (unsigned i = 0; i < sample_count; ++i) {
            func_under_test();
        }
    }
    clock_gettime(CLOCK_REALTIME, &out2);

    uint64_t elapsed_ns =
        (out2.tv_sec - out1.tv_sec) * 1000000000 +
        out2.tv_nsec - out1.tv_nsec;
    printf("%20s %10llu ns for %8llu calls, %6.2lf ns per one call in average\n",
           title ? title : "",
           elapsed_ns,
           sample_count,
           (double)elapsed_ns / (double)sample_count);
}

int main() {
    const uint64_t sample_count = 1000000;
    profiling_wrapper(sample_count, test_clock_gettime_realtime, "[clock_gettime real]");
    profiling_wrapper(sample_count, test_clock_gettime_monotonic, "[clock_gettime mono]");
    profiling_wrapper(sample_count, test_rdtsc, "[rdtsc]");
    profiling_wrapper(sample_count, test_std_chrono, "[std chrono]");

    return 0;
}

