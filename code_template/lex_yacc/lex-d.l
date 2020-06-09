%{
#include "y.tab.h"
#include <iostream>

using namespace std;

extern "C" {
    int yylex();
    static int yyinput(void);
    static void yyunput (int c, char *buf_ptr);
}

void func() {
    int c = 0;
    while (true) {
        c = yyinput();
        cout << "consume char: " << c << endl;
        if (c == '\n' || c == 0) break;
    }
    unput('\n');
    unput('+');
    unput(' ');
    unput('3');
    unput(' ');
    unput('5');
}

%}

%%

[0-9]+  { cout << "[token : NUMBER]" << endl; return NUMBER; }
[ \t]   { cout << "[token : space or tab]" << endl; }            /* ignore white space */
"$"     { cout << "[token : eof]" << endl; return 0; } /* end of input */
\n      { cout << "[token : newline]" << endl; return yytext[0]; }
.       { cout << "[token : other single char] : " << yytext << endl; return yytext[0]; }
ABC     { cout << "[token ABC!] : " << yytext << endl; func(); }

%%
