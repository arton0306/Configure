a:
	lex -o lex.yy.cpp lex-a.l
	yacc -o y.tab.cpp -d yacc-a.y
	g++ -o calc lex.yy.cpp y.tab.cpp -ly -ll
