#include <cstdio>
#include <ctime>
#include <cstdint>
#include <chrono>

using namespace std;

uint64_t test_clock_gettime_realtime() {
    struct timespec temp;
    clock_gettime(CLOCK_REALTIME, &temp);
    return temp.tv_nsec;
}

uint64_t test_clock_gettime_monotonic() {
    struct timespec temp;
    clock_gettime(CLOCK_MONOTONIC, &temp);
    return temp.tv_nsec;
}

uint64_t test_rdtsc() {
    return __builtin_ia32_rdtsc();
}

/*
void test_std_chrono() {
    using namespace std::chrono;
    high_resolution_clock::now();
}
*/

// note that the resolution of clock_gettime might be 1000 ns
void profiling_wrapper(uint64_t sample_count, uint64_t (*func_under_test)(), const char *title) {
    struct timespec out1, out2;
    clock_gettime(CLOCK_REALTIME, &out1);
    uint64_t min_diff = 1000000; // assume each sampling period do not excess 1ms
    uint64_t max_diff = 0;
    unsigned min_i = 0;
    unsigned max_i = 0;
    {
        uint64_t prev_ns = func_under_test();
        for (unsigned i = 1; i < sample_count; ++i) {
            uint64_t cur_ns = func_under_test();
            // printf("%llu\n", cur_ns);
            const uint64_t diff =
                cur_ns >= prev_ns ?
                    cur_ns - prev_ns :
                    1000000000 + cur_ns - prev_ns;
            if (max_diff <= diff) {
                max_diff = diff;
                max_i = i;
            }
            if (min_diff >= diff) {
                min_diff = diff;
                min_i = i;
            }
            prev_ns = cur_ns;
        }
    }
    clock_gettime(CLOCK_REALTIME, &out2);

    uint64_t elapsed_ns =
        (out2.tv_sec - out1.tv_sec) * 1000000000 +
        out2.tv_nsec - out1.tv_nsec;
    printf("%20s %10llu ns for %8llu calls, %6.2lf ns per one call in average, max_diff = %3llu, min_diff = %3llu, max_i = %u, min_i = %u\n",
           title ? title : "",
           elapsed_ns,
           sample_count,
           (double)elapsed_ns / (double)sample_count,
           max_diff, min_diff, max_i, min_i)
          ;
}

int main() {
    const uint64_t sample_count = 1000000;
    profiling_wrapper(sample_count, test_clock_gettime_realtime, "[clock_gettime real]");
    profiling_wrapper(sample_count, test_clock_gettime_monotonic, "[clock_gettime mono]");
    profiling_wrapper(sample_count, test_rdtsc, "[rdtsc]");
    // profiling_wrapper(sample_count, test_std_chrono, "[std chrono]");

    return 0;
}

