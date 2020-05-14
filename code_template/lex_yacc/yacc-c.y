%{
#include <iostream>
#include <cstdio>
#include <cstdlib>

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

using namespace std;

%}

%token NUMBER

%%

input:
      /* empty */
    | input line { cout << "grammar input line" << endl; }
    ;

line:
      '\n' { cout << "newline" << endl; }
    | exp '\n' { cout << "exp newline" << endl; printf("%.10g\n", $1); } 
    ;

exp:
      NUMBER { cout << "grammar:NUMBER" << endl; }
    | exp exp '+' { cout << "grammar exp exp +" << endl; $$ = $1 + $2; }
    | exp exp '-' { cout << "grammar exp exp -" << endl; $$ = $1 - $2; }
    | exp exp '*' { cout << "grammar exp exp *" << endl; $$ = $1 * $2; }
    | exp exp '/' { cout << "grammar exp exp /" << endl; $$ = $1 / $2; }
    ;

%%

int main() {
    yyparse();
    return 0;
}

