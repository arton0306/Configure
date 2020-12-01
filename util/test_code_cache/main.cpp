#include <iostream>
#include "foo.h"

using namespace std;

int main() {

    unsigned long x = MyClass::foo();
    cout << x << endl;

    unsigned long get_value();
    cout << get_value() << endl;

    return 0;
}
