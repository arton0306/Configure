//Program to test the new C++11 lambda syntax
#include <iostream>

using namespace std;

int main()
{
    cout << [](int m, int n) { return m + n;} (2,4) << endl;
    return 0;
}
