%{
    #include <stdlib.h>
    #include <stdio.h>

    int char_count = 0;
    int word_count = 0;
    int line_count = 0;
%}

/*
    Showing the usage of lex definition
*/

word [^ \t\n]+
eol \n

%%

{word} {
    char_count += yyleng;
    word_count += 1;
}

{eol} {
    line_count += 1;
}

. ;

%%

int main()
{
    yylex();
    printf("char count: %d\n", char_count);
    printf("word count: %d\n", word_count);
    printf("line count: %d\n", line_count);

    return 0;
}

int yywrap()
{
    return 1;
}
