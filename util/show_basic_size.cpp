#include <array>
#include <atomic>
#include <chrono>
#include <functional>
#include <iostream>
#include <map>
#include <memory>
#include <mutex>
#include <queue>
#include <set>
#include <unordered_map>
#include <unordered_set>
#include <vector>

#include <unistd.h>

using namespace std;

int main() {
    cout << "============================" << endl;
    cout << "Util - show size in bytes :)" << endl;
    cout << "============================" << endl;
#ifdef _SC_PAGESIZE
    cout << "pege size: " << sysconf(_SC_PAGESIZE) << endl;
#endif
#ifdef _SC_LEVEL1_DCACHE_LINESIZE
    cout << "cache line size: " << sysconf(_SC_LEVEL1_DCACHE_LINESIZE) << endl;
#endif
    cout << "-----" << endl;
    cout << "char: " << sizeof(char) << endl;
    cout << "short: " << sizeof(short) << endl;
    cout << "int: " << sizeof(int) << endl;
    cout << "long: " << sizeof(long) << endl;
    cout << "long long: " << sizeof(long long) << endl;
    cout << "size_t: " << sizeof(size_t) << endl;
    cout << "void*: " << sizeof(void*) << endl;
    cout << "void(*)(): " << sizeof(void(*)()) << endl;
    cout << "-----" << endl;
    cout << "array<int,10>: " << sizeof(array<int,10>) << endl;
    cout << "vector<int>: " << sizeof(vector<int>) << endl;
    cout << "vector<bool>: " << sizeof(vector<bool>) << endl;
    cout << "map<int,int>: " << sizeof(map<int,int>) << endl;
    cout << "unordered_map<int,int>: " << sizeof(unordered_map<int,int>) << endl;
    cout << "set<int,int>: " << sizeof(set<int,int>) << endl;
    cout << "unordered_set<int,int>: " << sizeof(unordered_set<int,int>) << endl;
    cout << "priority_queue<int>: " << sizeof(priority_queue<int>) << endl;
    cout << "priority_queue<double>: " << sizeof(priority_queue<double>) << endl;
    cout << "-----" << endl;
    cout << "string: " << sizeof(string) << endl;
    cout << "string_view: " << sizeof(string_view) << endl;
    cout << "-----" << endl;
    cout << "std function: " << sizeof(function<void()>) << endl;
    // new comment for the line below: c++2a still not work (Apple clang version 12.0.0 (clang-1200.0.32.27))
    // cout << "empty inline lambda: " << sizeof([](){}) << endl; // c++2a
    {
        auto f = [](){};
        cout << "empty lambda (store by auto): " << sizeof(f) << endl;
    }
    {
        int x;
        auto f = [x](int y){return y;};
        cout << "capture int lambda (store by auto): " << sizeof(f) << endl;
    }
    {
        int x,y,z;
        auto f = [x,y,z](){};
        cout << "capture int,int,int lambda (store by auto): " << sizeof(f) << endl;
    }
    {
        short x;
        int y;
        short z;
        auto f = [x,y,z](){};
        cout << "capture short,int,short lambda (store by auto): " << sizeof(f) << endl;
    }
    {
        short x;
        short y;
        int z;
        auto f = [x,y,z](){};
        cout << "capture short,short,int lambda (store by auto): " << sizeof(f) << endl;
    }
    {
        int *p1, *p2, *p3, *p4, *p5;
        auto f = [p1,p2,p3,p4,p5](){};
        cout << "capture 5 pointers lambda (store by auto): " << sizeof(f) << endl;
    }
    {
        int *p1, *p2, *p3, *p4, *p5;
        int *p1b, *p2b, *p3b, *p4b, *p5b;
        auto f = [p1,p2,p3,p4,p5,p1b,p2b,p3b,p4b,p5b](){};
        // cout << "capture 10 pointers lambda (store by auto): " << sizeof([p1,p2,p3,p4,p5,p1b,p2b,p3b,p4b,p5b](){}) << endl;
        cout << "capture 10 pointers lambda (store by auto): " << sizeof(f) << endl;
    }
    cout << "-----" << endl;
    cout << "unique_ptr<int>: " << sizeof(unique_ptr<int>) << endl;
    cout << "shared_ptr<int>: " << sizeof(shared_ptr<int>) << endl;
    cout << "weak_ptr<int>: " << sizeof(weak_ptr<int>) << endl;
    cout << "-----" << endl;
    cout << "struct timespec: " << sizeof(struct timespec) << endl;
    cout << "chrono::high_resolution_clock::time_point: " << sizeof(chrono::high_resolution_clock::time_point) << endl;
    cout << "-----" << endl;
    cout << "mutex: " << sizeof(mutex) << endl;
    cout << "recursive_mutex: " << sizeof(recursive_mutex) << endl;
    cout << "atomic<bool>: " << sizeof(atomic<bool>) << endl;
    cout << "atomic<int>: " << sizeof(atomic<int>) << endl;
    cout << "atomic<double>: " << sizeof(atomic<double>) << endl;

    return 0;
}
