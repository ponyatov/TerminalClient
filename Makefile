# var
MODULE  = $(notdir $(CURDIR))

# dir
CWD  = $(CURDIR)
BIN  = $(CWD)/bin
INC  = $(CWD)/inc
SRC  = $(CWD)/src
TMP  = $(CWD)/tmp

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

# install
.PHONY: install update gz ref
install: gz ref
	$(MAKE) update
update:
	sudo apt update
	sudo apt install -uy `cat apt.txt`
gz:
ref: ref/master/.gitmodules ref/qt5/.gitmodules
ORIGIN = https://github.com/AlexObukhoff/TerminalClient
ref/master/.gitmodules:
	git clone --depth 1 -o gh -b master $(ORIGIN) ref/master
ref/qt5/.gitmodules:
	git clone --depth 1 -o gh -b qt5    $(ORIGIN) ref/qt5
