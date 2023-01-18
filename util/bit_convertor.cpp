#include <iostream>
#include <string>
#include <arpa/inet.h>

bool is_big_endian() {
    return (htonl(47) == 47);
}

void dump_hex(uint8_t *buf, int count) {
    for (int i = 0; i < count-1; ++i) {
        printf("%02x ", buf[i]);
    }
    printf("%02x\n", buf[count-1]);
}

void dump_double_hex(double v) {
    uint64_t temp = *(uint64_t*)&v;
    if (! is_big_endian()) {
        temp = __builtin_bswap64(temp);
    }
    dump_hex((uint8_t*)(&temp), 8);
}

int main(int argc, const char *argv[]) {
    using namespace std;
    const double v = stod(argv[1]);
    dump_double_hex(v);

    return 0;
}
