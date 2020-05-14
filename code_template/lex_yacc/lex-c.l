%{
#include "y.tab.h"
#include <iostream>

extern "C" {
    int yylex();
}
%}

%%

[0-9]+ { std::cout << "[token : NUMBER]" << std::endl; return NUMBER; }

.	return yytext[0];

%%



