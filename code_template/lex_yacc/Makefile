# https://resources.oreilly.com/examples/9781565920002/blob/master/ch3-03.l
# https://resources.oreilly.com/examples/9781565920002/blob/master/ch3-03.y

# xxx means the general build
# xxx2 means building without liby
# xxx3 means without liby and using handwriting yylex
# xxxg means define YYDEBUG

a:
        lex -o lex.yy.cpp lex-a.l
        yacc -o y.tab.cpp -d yacc-a.y
        g++ -o calc lex.yy.cpp y.tab.cpp -ll
a2:
        lex -o lex.yy.cpp lex-a.l
        yacc -o y.tab.cpp -d yacc-a.y
        g++ -o calc lex.yy.cpp y.tab.cpp -ll -DNO_LIB_Y
b:
        lex -o lex.yy.cpp lex-b.l
        yacc -o y.tab.cpp -d yacc-b.y
        g++ -o rrconflict lex.yy.cpp y.tab.cpp -ll
b2:
        lex -o lex.yy.cpp lex-b.l
        yacc -o y.tab.cpp -d yacc-b.y
        g++ -o rrconflict lex.yy.cpp y.tab.cpp -ll -DNO_LIB_Y
c:
        lex -o lex.yy.cpp lex-c.l
        yacc -o y.tab.cpp -d yacc-c.y
        g++ -o c lex.yy.cpp y.tab.cpp -ll
c2:
        lex -o lex.yy.cpp lex-c.l
        yacc -o y.tab.cpp -d yacc-c.y
        g++ -o c lex.yy.cpp y.tab.cpp -ll -DNO_LIB_Y

# define YYDEBUG
# might need to setenv YYDEBUG to 1 (check y.tab.cpp)
c2g:
        lex -o lex.yy.cpp lex-c.l
        yacc -o y.tab.cpp -d yacc-c.y
        g++ -o c lex.yy.cpp y.tab.cpp -DYYDEBUG -ll -DNO_LIB_Y
c3:
        yacc -o y.tab.cpp -d yacc-c.y
        g++ -o c y.tab.cpp -ll -DNO_LIB_Y -DEMBED_YYLEX
ifelse2:
        lex -o lex.yy.cpp lex-ifelse.l
        yacc -o y.tab.cpp -d yacc-ifelse.y
        g++ -o ifelse lex.yy.cpp y.tab.cpp -ll -DNO_LIB_Y
