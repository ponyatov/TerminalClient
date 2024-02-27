# var
MODULE  = $(notdir $(CURDIR))

# dir
CWD  = $(CURDIR)
BIN  = $(CWD)/bin
INC  = $(CWD)/inc
SRC  = $(CWD)/src
TMP  = $(CWD)/tmp
REF  = $(CWD)/ref
GZ   = $(HOME)/gz

# tool
CURL = curl -L -o
CF   = clang-format

# src
C += $(wildcard src/*.c*)
H += $(wildcard inc/*.h*)

# cfg
CFLAGS += -I$(INC) -I$(TMP)

# all
.PHONY: all
all: bin/$(MODULE) lib/$(MODULE).ini
	$^

# format
format: tmp/format_cpp
tmp/format_cpp: $(C) $(H)
	$(CF) -style=file -i $? && touch $@

# rule
bin/$(MODULE): $(C) $(H)
	$(CXX) $(CFLAGS) -o $@ $(C) $(L)

# doc
.PHONY: doxy
doxy: .doxygen $(C) $(D)
	rm -rf docs ; doxygen $< 1>/dev/null

.PHONY: doc
doc: \
	doc/Book_Cyberplat.pdf

doc/Book_Cyberplat.pdf:
	$(CURL) $@ https://www.cyberplat.ru/download/Book_Cyberplat.pdf

# install
.PHONY: install update gz ref
install: doc gz ref
	$(MAKE) update
update:
	sudo apt update
	sudo apt install -uy `cat apt.txt`
gz:
ref: ref/master/.gitmodules ref/qt5/README.md
ORIGIN = https://github.com/AlexObukhoff/TerminalClient
ref/master/.gitmodules:
	git clone --depth 1 -o gh -b master $(ORIGIN) ref/master
ref/qt5/README.md: $(GZ)/$(MODULE)-qt5.zip
	unzip -d ref/qt5 $< && touch $@
$(GZ)/$(MODULE)-qt5.zip:
	$(CURL) $@ https://github.com/AlexObukhoff/TerminalClient/archive/refs/heads/qt5.zip
