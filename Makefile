# Makefile for lsqlcipher library for Lua

LIBNAME= lsqlcipher

LUAEXE= lua

ROCKSPEC= $(shell find . -name $(LIBNAME)-*-*.rockspec)

PLATFORM=$(shell uname -s)

ifeq ($(PLATFORM),Darwin)
LUAROCKS_OPT=SQLCIPHER_INCDIR="$$HOME/.local/include/sqlcipher" SQLCIPHER_LIBDIR="$$HOME/.local/lib"
endif

all: install

install:
	luarocks make $(ROCKSPEC) $(LUAROCKS_OPT)

test:
	$(LUAEXE) test/test.lua
	$(LUAEXE) test/tests-sqlite3.lua lsqlcipher
	# $(LUAEXE) test/tests-sqlite3.lua lsqlite3complete

.PHONY: all test install
