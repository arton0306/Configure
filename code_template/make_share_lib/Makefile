all: exe

exe: a.out
	LD_LIBRARY_PATH=. ./a.out

a.out: libsum.so
	g++ main.cpp libsum.so -o a.out

libsum.so: sum.o
	g++ -fPIC -shared -o libsum.so sum.o

sum.o: sum.cpp
	g++ -c sum.cpp -o sum.o

clean:
	rm -f sum.o libsum.so a.out
