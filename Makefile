# Makefile for lsqlcipher library for Lua

LIBNAME= lsqlcipher

LUAEXE= lua

ROCKSPEC= $(shell find . -name $(LIBNAME)-*-*.rockspec)

all: install

install:
	luarocks make $(ROCKSPEC) SQLCIPHER_INCDIR="$$HOME/.local/include/sqlcipher" SQLCIPHER_LIBDIR="$$HOME/.local/lib"

test:
	$(LUAEXE) test/test.lua
	$(LUAEXE) test/tests-sqlite3.lua lsqlcipher
	# $(LUAEXE) test/tests-sqlite3.lua lsqlite3complete

.PHONY: all test install
