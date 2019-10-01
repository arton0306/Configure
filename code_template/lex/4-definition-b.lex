%{
    #include <iostream>

/*
    extern "C" {
        int yylex(void);
        int yywrap();
    }
    */

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
    using namespace std;

    yylex();
    cout << "char count: " << char_count << endl;
    cout << "word count: " << word_count << endl;
    cout << "line count: " << line_count << endl;

    return 0;
}

int yywrap()
{
    return 1;
}
