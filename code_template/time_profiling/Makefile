all: .FORCE
	gcc -O2 rdtsc.c -o rdtsc && ./rdtsc
	g++ -std=c++17 -O2 -Wall time_sampling3.cpp -o test3 && ./test3

rdtsc: .FORCE
	gcc -O2 rdtsc.c -o rdtsc && ./rdtsc

old:
	g++ -std=c++17 -O2 -Wall time_sampling.cpp -o test1 && ./test1
	g++ -std=c++17 -O2 -Wall time_sampling2.cpp -o test2 && ./test2

clean:
	rm -f ./rdtsc ./test1 ./test2 ./test3 ./rdtsc

.FORCE:
