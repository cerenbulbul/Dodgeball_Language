dodgeball2: lex.yy.c y.tab.c
	gcc -g lex.yy.c y.tab.c -o dodgeball2

lex.yy.c: y.tab.c dodgeball2.l
	lex dodgeball2.l

y.tab.c: dodgeball2.y
	yacc -d dodgeball2.y

clean: 
	rm -rf lex.yy.c y.tab.c y.tab.h dodgeball2 dodgeball2.dSYM
