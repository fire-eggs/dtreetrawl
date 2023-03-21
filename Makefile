CC = gcc

CFLAGS = -O3 -I./ \
	 -Wall \
	 -Wextra \
	 $(shell pkg-config --cflags glib-2.0)
LDFLAGS = $(shell pkg-config --libs glib-2.0)

PROG = dtreetrawl
HDRS = dtreetrawl.h
SRCS = dtreetrawl.c

OBJS = $(SRCS:.c=.o)

all : $(PROG)

$(PROG) : $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(PROG) $(LDFLAGS)

dtreetrawl.o : dtreetrawl.c dtreetrawl.h

.PHONY : clean install uninstall

clean :
	rm -f core $(PROG) $(OBJS)

install : uninstall
	mkdir -p $(DESTDIR)/usr/bin
	install -m 0755 dtreetrawl $(DESTDIR)/usr/bin/dtreetrawl

uninstall :
	rm -f $(DESTDIR)/usr/bin/dtreetrawl
