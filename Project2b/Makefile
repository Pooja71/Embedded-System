CC = gcc
CFLAGS = -Wall -O3 -march=armv7-a -mfpu=neon -mcpu=cortex-a8 -mtune=cortex-a8  -ftree-vectorize -ftree-vectorizer-verbose=7 -fverbose-asm -O3 -funsafe-loop-optimizations #-ftree-loop-distribute-patterns -fwhole-program -fforward-propagate 


all:alpha.out alpha.s

alpha.out: alpha.o
	$(CC) $(CFLAGS) -o $@ $< 

alpha.o: alpha_time.c
	$(CC) $(CFLAGS) -c $< -o $@

alpha.s: alpha_time.c
	$(CC) -Wa,-adhln -g alpha_time.c > alpha_time.s

clean:
	rm -f *.out *.o
