#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <cstring>

using namespace std;

#define trace(...) __f(#__VA_ARGS__, __VA_ARGS__)
template <typename Arg1>
void __f(const char* name, Arg1&& arg1) {
    std::cerr << name << ": " << arg1 << endl;
}
template <typename Arg1, typename... Args>
void __f(const char* names, Arg1&& arg1, Args&&... args) {
    const char *comma = strchr(names + 1, ',');
    std::cerr.write(names, comma - names) << ": " << arg1 << " |";
    __f(comma + 1, args...);
}

int main() {
    int x = 5;
    double pi = 3.14;
    char c = 'z';
    trace(x,pi,c);
    return 0;
}
