all: .FORCE
	g++ -std=c++17 time_sampling.cpp -o test1 && ./test1
	g++ -std=c++17 time_sampling2.cpp -o test2 && ./test2

rdtsc: .FORCE
	gcc rdtsc.c -o rdtsc && ./rdtsc

clean:
	rm -f ./test1 ./test2 ./rdtsc

.FORCE:
