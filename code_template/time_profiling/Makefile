all: .FORCE
	g++ -std=c++17 -O2 time_sampling.cpp -o test1 && ./test1
	g++ -std=c++17 -O2 time_sampling2.cpp -o test2 && ./test2
	g++ -std=c++17 -O2 time_sampling3.cpp -o test3 && ./test3

rdtsc: .FORCE
	gcc -O2 rdtsc.c -o rdtsc && ./rdtsc

clean:
	rm -f ./test1 ./test2 ./rdtsc

.FORCE:
