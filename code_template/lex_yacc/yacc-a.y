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

double vbltable[26];
%}

%union {
	double dval;
	int vblno;
}

%token <vblno> NAME
%token <dval> NUMBER
%left '-' '+'
%left '*' '/'
%nonassoc UMINUS

%type <dval> expression
%%
statement_list:	statement '\n'
	|	statement_list statement '\n'
	;

statement:	NAME '=' expression	{ vbltable[$1] = $3; }
	|	expression		{ std::cout << "= " << $1 << std::endl; }
	;

expression:	expression '+' expression { $$ = $1 + $3; }
	|	expression '-' expression { $$ = $1 - $3; }
	|	expression '*' expression { $$ = $1 * $3; }
	|	expression '/' expression
				{	if($3 == 0.0)
						yyerror("divide by zero");
					else
						$$ = $1 / $3;
				}
	|	'-' expression %prec UMINUS	{ $$ = -$2; }
	|	'(' expression ')'	{ $$ = $2; }
	|	NUMBER
	|	NAME			{ $$ = vbltable[$1]; }
	;
%%

int main() {
    yyparse();
    return 0;
}
