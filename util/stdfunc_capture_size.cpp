#include <iostream>
#include <new>
#include <functional>

// 全局变量来跟踪内存分配次数
static int allocation_count = 0;

// 重载全局 new 运算符
void* operator new(std::size_t size) {
    ++allocation_count;
    std::cout << "Allocating " << size << " bytes\n";
    return std::malloc(size);
}

// 重载全局 delete 运算符
void operator delete(void* ptr) noexcept {
    std::free(ptr);
}

template <std::size_t N>
struct TestObject {
    char data[N];
};

void reset_allocation_count() {
    allocation_count = 0;
}

int get_allocation_count() {
    return allocation_count;
}

template <std::size_t N>
void test_capture() {
    TestObject<N> obj;
    reset_allocation_count();
    std::function<void()> func = [obj]() {
        std::cout << "Captured object of size " << N << " bytes\n";
    };
    std::cout << "Capture size " << N << " bytes, allocation count: " << get_allocation_count() << std::endl;
}

int main() {
    // 测试不同大小的捕获对象
    test_capture<8>();
    test_capture<12>();
    test_capture<16>();
    test_capture<20>();
    test_capture<24>();
    test_capture<28>();
    test_capture<32>();
    test_capture<36>();
    test_capture<40>();

    return 0;
}

