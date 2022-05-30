CC = gcc
CFLAGS = -Wall -Wextra -Werror -O0 -ggdb -std=c18

all: gendoc

gendoc: gendoc.c
	$(CC) $(CFLAGS) -o $@ $^

clean:
	rm -f gendoc
