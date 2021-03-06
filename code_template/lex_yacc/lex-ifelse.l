%{
#include "y.tab.h"
#include <iostream>

using namespace std;

extern "C" {
    int yylex();
}
%}

%%

if      { cout << "[token : IF]" << endl; return IF; }
then    { cout << "[token : THEN]" << endl; return THEN; }
else    { cout << "[token : ELSE]" << endl; return ELSE; }
[0-9]+  { cout << "[token : NUMBER]" << endl; return NUMBER; }
[ \t]	{ cout << "[token : space or tab]" << endl; }	  /* ignore white space */
"$"	{ cout << "[token : eof]" << endl; return 0; }    /* end of input */ 
\n	{ cout << "[token : newline]" << endl; return yytext[0]; }
.	{ cout << "[token : other single char] : " << yytext << endl; return yytext[0]; }

%%



