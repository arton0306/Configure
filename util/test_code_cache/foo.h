_Pragma("GCC diagnostic push")
_Pragma("GCC diagnostic ignored \"-Wreturn-local-addr\"")

struct MyClass {
    static unsigned long foo() {
        unsigned x;
        return (unsigned long)(void *)(&x);
    }
};

_Pragma("GCC diagnostic pop")
