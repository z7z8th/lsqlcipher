
PLATFORM=$(shell uname -s)

ifeq ($(PLATFORM),Darwin)
LUAROCKS_OPT=SQLCIPHER_CONFIGURE=--prefix=$$HOME/.local
endif

all: build

build:
	luarocks build sqlcipher*.rockspec $(LUAROCKS_OPT)