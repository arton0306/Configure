#include <iostream>

using namespace std;

class MyClass {
    int x;
    int X;
    int abc_def;
    int abc_def_;
    int abcDef;
    int AbcDef;
    int Abc_Def_Ghi;
    static int s;
    static int S;
};

template <typename T>
class HTML1 {};

template <typename ABC>
class HTML2 {};

template <typename ABC_T>
class HTML3 {};

template <typename ABC_DEF_T>
class HTML5 {};

template <typename AbcDef_T>
class HTML6 {};

int main() {
    int x;
    int X;
    int x_y;
    
    cout << "test_tidy" << endl;

    return 0;
}
