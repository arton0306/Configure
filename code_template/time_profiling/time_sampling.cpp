#include <cstdio>
#include <ctime>
#include <cstdint>
#include <chrono>

using namespace std;

int main() {

    const uint64_t sample_count = 1000000;

    struct timespec out1, out2;
    clock_gettime(CLOCK_REALTIME, &out1);
    {
        if (0) { // test clock_gettime
            for (unsigned i = 0; i < sample_count; ++i) {
                struct timespec temp;
                clock_gettime(CLOCK_REALTIME, &temp);
            }
        }

        if (0) { // test rdtsc
            for (unsigned i = 0; i < sample_count; ++i) {
                uint64_t temp;
                temp = __builtin_ia32_rdtsc();
            }
        }

        if (1) { // test c++ chrono
            for (unsigned i = 0; i < sample_count; ++i) {
                using namespace std::chrono;
                high_resolution_clock::time_point t1 = high_resolution_clock::now();
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
