#!/usr/bin/env bash
mkdir -p ./compiler
git clone git://sourceware.org/git/binutils-gdb.git ./compiler/binutils-gdb
export PREFIX="$HOME/opt/cross"
export TARGET=i686-elf
export PATH="$PREFIX/bin:$PATH"
mkdir -p ./compiler/binutils-gdb/build-binutils
pushd ./compiler/binutils-gdb/build-binutils || exit
../configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror
make
make install
popd || exit
git clone git://gcc.gnu.org/git/gcc.git ./compiler/gcc
mkdir ./compiler/gcc/build-gcc
pushd ./compiler/gcc/build-gcc || exit
../configure --target=$TARGET --prefix="$PREFIX" --disable-nls --enable-languages=c,c++ --without-headers
make all-gcc
make all-target-libgcc
make install-gcc
make install-target-libgcc
popd || exit
rm -rf ./compiler/