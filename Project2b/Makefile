CC = gcc
CFLAGS = -Wall -march=armv7-a -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a8 -mtune=cortex-a8 -O3 -ggdb -ffast-math -fsingle-precision-constant -fno-tree-loop-vectorize -fno-tree-vectorize -fno-unroll-loops

test: alpha_time.o
	$(CC) alpha_time.o -pg -g -static -lrt -lm -o $@

main_list.s: alpha_time.c
	$(CC) $(CFLAGS) -Wa,-adhln -g alpha_time.c -c > main_list.s

clean:
	rm -f test *.o  *.s
