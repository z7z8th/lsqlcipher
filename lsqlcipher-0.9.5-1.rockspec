package = "lsqlcipher"
version = "0.9.5-1"
source = {
    url = "https://github.com/sqlcipher/sqlcipher/archive/v4.4.2.zip",
    file = "sqlcipher-4.4.2.zip"
}
description = {
    summary = "A binding for Lua to the SQLite3+SQLCipher database library",
    detailed = [[
        lsqlcipher is a thin wrapper around the public domain SQLite3 database engine. SQLite3 is
        dynamically linked to lsqlcipher. The statically linked alternative is lsqlciphercomplete.
        The lsqlcipher module supports the creation and manipulation of SQLite3 databases.
        Most sqlite3 functions are called via an object-oriented interface to either
        database or SQL statement objects.
    ]],
    license = "MIT",
    homepage = "http://lua.sqlite.org/"
}
dependencies = {
    "lua >= 5.1, < 5.5"
}
external_dependencies = {
    SQLCIPHER = {
        header = "sqlite3.h"
    }
}
build = {
    type = "builtin",
    modules = {
        lsqlcipher = {
            sources = { "lsqlcipher.c" },
            defines = {'LSQLITE_VERSION="0.9.5"', 'SQLITE_HAS_CODEC'},
            libraries = { "sqlcipher" },
            incdirs = {
                        "/opt/local/include/sqlcipher",
                        "/usr/local/include/sqlcipher",
                        "$(SQLCIPHER_INCDIR)"
                    },
            libdirs = {
                        "/opt/local/lib",
                        "/usr/local/lib",
                        "$(SQLCIPHER_LIBDIR)"
                    }
        },
    },
	copy_directories = { 'doc', 'examples' }
}
