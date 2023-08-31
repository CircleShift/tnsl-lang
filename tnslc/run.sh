#!/bin/bash

BUILD_DIR="./build"
ARTIFACTS_DIR="$BUILD_DIR/artifacts"

if [ ! -d $BUILD_DIR ]; then
	mkdir $BUILD_DIR
fi

if [ ! -d $ARTIFACTS_DIR ]; then
	mkdir $ARTIFACTS_DIR
fi

../tint -in tnslc.tnsl -flags "$1"
mv -f "$1.asm" "$ARTIFACTS_DIR/$1.asm"
nasm -f elf64 -o "$ARTIFACTS_DIR/$1.o" "$ARTIFACTS_DIR/$1.asm"
clang -o "./build/${1%.*}" "$ARTIFACTS_DIR/$1.o"

