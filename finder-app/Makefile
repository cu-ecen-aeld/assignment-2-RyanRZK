CC := $(CROSS_COMPILE)gcc
RM := rm -f

.PHONY: all clean

all: writefile

writefile: writefile.o
	$(CC) -o writefile writefile.o

writefile.o: writefile.c
	$(CC) -c writefile.c

clean:
	$(RM) writefile writefile.o
