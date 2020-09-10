#include <iostream>

// base 1
template <typename RetType>
RetType sum() {
    return (RetType)0;
}

// base 2
template <typename RetType>
RetType sum(RetType v) {
    return v;
}

template <typename RetType, typename... Args>
RetType sum(RetType v, Args... args) {
    return v + sum(args...);
}

using namespace std;

int main() {
    cout << sum(1,2,3,4,5) << endl;    // compiled, error if remove base 2 because RetType can not be infered
    cout << sum(1) << endl;            // compiled, error if remove base 2 because RetType can not be infered 
    cout << sum<int>() << endl;        // compiled, because of base 1
    return 0;
}
