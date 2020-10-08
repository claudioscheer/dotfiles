CC=g++
CFLAGS=-std=c++17 -larmadillo -lmlpack -lboost_serialization -fopenmp -ltbb

build:
	$(CC) linear-regression.cpp -o linear-regression.o $(CFLAGS)

ep: build
	./linear-regression.o EP ../csv/EP.csv 0.2 $(operations_to_perform)

cg: build
	./linear-regression.o CG ../csv/CG.csv 0.2 $(operations_to_perform)

.PHONY : clean
clean:
	rm -rf *.o
