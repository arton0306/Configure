%%
[\n\t ] ;
-?(([0-9]+)|([0-9]*\.[0-9]+)([eE][-+]?[0-9]+)?) { printf("number\n"); }
. ECHO;
%%

int main()
{
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}
