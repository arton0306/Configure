#include <iostream>
#include <map>
#include <unordered_map>
#include <set>
#include <unordered_set>
#include <vector>

using namespace std;

int main() {
    cout << "short: " << sizeof(short) << endl;
    cout << "int: " << sizeof(int) << endl;
    cout << "long: " << sizeof(long) << endl;
    cout << "long long: " << sizeof(long long) << endl;
    cout << "size_t: " << sizeof(size_t) << endl;
    cout << "void*: " << sizeof(void*) << endl;
    cout << "-----" << endl;
    cout << "vector<int>: " << sizeof(vector<int>) << endl;
    cout << "vector<bool>: " << sizeof(vector<bool>) << endl;
    cout << "map<int,int>: " << sizeof(map<int,int>) << endl;
    cout << "unordered_map<int,int>: " << sizeof(unordered_map<int,int>) << endl;
    cout << "set<int,int>: " << sizeof(set<int,int>) << endl;
    cout << "unordered_set<int,int>: " << sizeof(unordered_set<int,int>) << endl;
    cout << "-----" << endl;
    cout << "unique_ptr<int>: " << sizeof(unique_ptr<int>) << endl;
    cout << "shared_ptr<int>: " << sizeof(shared_ptr<int>) << endl;

    return 0;
}
