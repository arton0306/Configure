%{
extern "C" {
    int yylex();
}
%}

%%

\n	|
.	return yytext[0];

%%


