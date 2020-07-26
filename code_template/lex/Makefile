lex1: 1.lex
	lex -o 1.yy.c 1.lex
	gcc 1.yy.c -o lex1

lex2: 2.lex
	lex -o 2.yy.c 2.lex
	gcc 2.yy.c -o lex2

lex3: 3.lex
	lex -o 3.yy.c 3.lex
	gcc 3.yy.c -o lex3

lex4: 4-definition.lex
	lex -o 4.yy.c 4-definition.lex
	gcc 4.yy.c -o lex4

lex4b: 4-definition-b.lex
	lex -o 4b.yy.cpp 4-definition-b.lex
	g++ 4b.yy.cpp -o lex4b

cleanall:
	rm -f *.c *.cpp a.out
