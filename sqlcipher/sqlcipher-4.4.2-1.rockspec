package = "sqlcipher"
version = "4.4.2-1"
source = {
    url = "https://github.com/sqlcipher/sqlcipher/archive/v4.4.2.zip",
    -- url = 'file:///Users/tmp/src/sqlcipher-4.4.2.zip',
    file = "sqlcipher-4.4.2.zip"
}
description = {
    summary = "SQLCipher is a security extension to SQLite3 database library",
    detailed = [[
        SQLCipher is an open source library that provides transparent, secure 256-bit AES encryption of SQLite database files.
    ]],
    license = "MIT",
    homepage = "https://www.zetetic.net/sqlcipher"
}

build = {
    type = "command",
    modules = {
        lsqlcipher = {
        },
    },
    build_command = './configure $(SQLCIPHER_CONFIGURE) --disable-tcl --enable-tempstore=yes CFLAGS="-DSQLITE_HAS_CODEC" LDFLAGS="-L/opt/local/lib -lcrypto" && make',
    install_command = "make install",
}
