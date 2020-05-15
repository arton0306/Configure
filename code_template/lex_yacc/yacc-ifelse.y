%{
#include <iostream>
#include <cstdio>
#include <cstdlib>

#ifdef EMBED_YYLEX
    #include <cctype>
#endif

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
%token IF
%token THEN
%token ELSE

%%

stmt:
      expr
      | if_stmt
      ;

if_stmt:
         IF expr THEN stmt
         | IF expr THEN stmt ELSE stmt
         ;

expr:
      NUMBER
      ;

%%

#ifdef EMBED_YYLEX
    int yylex (void)
    {
        int c = getchar ();
        while (c == ' ' || c == '\t') {
            c = getchar ();
        }
        if (c == '.' || isdigit (c)) {
            ungetc (c, stdin);
            scanf ("%lf", &yylval);
            return NUMBER;
        }
        else if (c == EOF) {
            return 0;
            // return YYEOF;
        } else {
            return c;
        }
    }
#endif

int main() {
    yyparse();
    return 0;
}

