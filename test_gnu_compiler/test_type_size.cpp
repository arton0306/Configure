#include <iostream>

using namespace std;

int main()
{
    cout << "size of a char: " << sizeof(char) << " bytes" << endl;
    cout << "size of a short: " << sizeof(short) << " bytes" << endl;
    cout << "size of a int: " << sizeof(int) << " bytes" << endl;
    cout << "size of a long: " << sizeof(long) << " bytes" << endl;
    cout << "size of a long long: " << sizeof(long long) << " bytes" << endl;
    cout << "size of a float: " << sizeof(float) << " bytes" << endl;
    cout << "size of a double: " << sizeof(double) << " bytes" << endl;
    cout << "size of a long double: " << sizeof(long double) << " bytes" << endl;
    cout << "size of a pointer: " << sizeof( void * ) << " bytes" << endl;
    return 0;
}
