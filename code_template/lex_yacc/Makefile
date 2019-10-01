# https://resources.oreilly.com/examples/9781565920002/blob/master/ch3-03.l
# https://resources.oreilly.com/examples/9781565920002/blob/master/ch3-03.y
a:
	lex -o lex.yy.cpp lex-a.l
	yacc -o y.tab.cpp -d yacc-a.y
	g++ -o calc lex.yy.cpp y.tab.cpp -ly -ll
