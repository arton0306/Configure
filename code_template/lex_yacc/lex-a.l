%{
#include "y.tab.hpp"
#include <math.h>
extern double vbltable[26];

extern "C" {
    int yylex();
}

%}

%%
([0-9]+|([0-9]*\.[0-9]+)([eE][-+]?[0-9]+)?) {
	yylval.dval = atof(yytext); return NUMBER;
	}

[ \t]	;		 /* ignore white space */

[a-z]	{ yylval.vblno = yytext[0] - 'a'; return NAME; }

"$"	{ return 0; /* end of input */ }

\n	|
.	return yytext[0];
%%
