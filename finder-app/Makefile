CC := $(CROSS_COMPILE)gcc
RM := rm -f

.PHONY: all clean

all: writer

writer: writer.o
	$(CC) -o writer writer.o

writer.o: writer.c
	$(CC) -c writer.c

clean:
	$(RM) writer writer.o
