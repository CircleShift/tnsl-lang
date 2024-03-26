#!/bin/bash

BUILD_DIR=./out
ARTIFACT_DIR=$BUILD_DIR/artifacts

mkdir -p $BUILD_DIR
mkdir -p $ARTIFACT_DIR
filename=tnslc.tnsl
filename="${filename%.*}"
./ctc $filename.tnsl $ARTIFACT_DIR/$filename.asm
nasm -f elf64 -o $ARTIFACT_DIR/$filename.o $ARTIFACT_DIR/$filename.asm
gcc -o $BUILD_DIR/$filename $ARTIFACT_DIR/$filename.o

