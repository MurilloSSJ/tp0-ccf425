make compile:
	flex lex.l
	gcc lex.yy.c

make run:
	./a.out < entrada.txt

make compile_run_2:
	flex lex2.l
	gcc lex.yy.c
	./a.out < entrada2.txt