
#include <map>

#include <vector>
#include <iostream>

using namespace std;

template <  typename     T>
         int foo (T dummy, int x,
    int y)  {
                   return 5;
         }



struct MYSTRUCT{
    int m1;
    int m2;
};

int   main() {
      MYSTRUCT my;

    cout << foo(3,
            4,5);

    cout << foo  (3,  4, 5);


    return 0;
}





