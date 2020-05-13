%{
#include <iostream>

#ifdef NO_LIB_Y
    extern "C" {
        int yylex(void);
        void yyerror(const char *msg) {
            std::cout << "[error msg]: " << msg << std::endl;
        }
    }
#else
    extern "C" {
        int yylex(void);
        void yyerror(const char *);
    }
#endif

%}

%%

statements: hello '\n' | statements hello;

hello:            r1 '-' '-' { std::cout << "hello 1" << std::endl; }
            |     r2 '-' '+' { std::cout << "hello 2" << std::endl; }
            |     '\n' { }
            ;

r1:               'r' { std::cout << "r1(r)" << std::endl; }
            |     '1' { std::cout << "r1(1)" << std::endl; }
            ;

r2:               'r' { std::cout << "r2(h)" << std::endl; }
            |     '2' { std::cout << "r2(2)" << std::endl; }
            ;

%%

int main() {
    yyparse();
    return 0;
}
