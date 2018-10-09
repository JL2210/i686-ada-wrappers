PREFIX ?= /usr
LIBDIR := $(PREFIX)/lib
BINDIR := $(PREFIX)/bin
ARCH ?= i686-pc

all: $(ARCH)-linux-gnu-gnatmake $(ARCH)-linux-gnu-gnatlink $(ARCH)-linux-gnu-gnatgcc $(ARCH)-linux-gnu-gnatbind

$(ARCH)-linux-gnu-gnatmake: i686-linux-gnu-gnatmake.in
	sed 's,@ARCH@,$(ARCH),g' i686-linux-gnu-gnatmake.in > $(ARCH)-linux-gnu-gnatmake
	chmod a+x $(ARCH)-linux-gnu-gnatmake

$(ARCH)-linux-gnu-gnatlink: i686-linux-gnu-gnatlink.in
	sed 's,@ARCH@,$(ARCH),g' i686-linux-gnu-gnatlink.in > $(ARCH)-linux-gnu-gnatlink
	chmod a+x $(ARCH)-linux-gnu-gnatlink

$(ARCH)-linux-gnu-gnatgcc: i686-linux-gnu-gnatgcc.in
	sed -e 's,@ARCH@,$(ARCH),g' -e 's,@LIBDIR@,$(LIBDIR),g' i686-linux-gnu-gnatgcc.in > $(ARCH)-linux-gnu-gnatgcc
	chmod a+x $(ARCH)-linux-gnu-gnatgcc

$(ARCH)-linux-gnu-gnatbind: i686-linux-gnu-gnatbind.in
	sed -e 's,@ARCH@,$(ARCH),g' -e 's,@LIBDIR@,$(LIBDIR),g' i686-linux-gnu-gnatbind.in > $(ARCH)-linux-gnu-gnatbind
	chmod a+x $(ARCH)-linux-gnu-gnatbind

install: all
	install -Dm755 $(ARCH)-linux-gnu-gnatgcc $(BINDIR)/
	install -Dm755 $(ARCH)-linux-gnu-gnatbind $(BINDIR)/
	install -Dm755 $(ARCH)-linux-gnu-gnatmake $(BINDIR)/
	install -Dm755 $(ARCH)-linux-gnu-gnatlink $(BINDIR)/

clean:
	rm -f $(ARCH)-linux-gnu-gnatmake $(ARCH)-linux-gnu-gnatlink $(ARCH)-linux-gnu-gnatgcc $(ARCH)-linux-gnu-gnatbind
