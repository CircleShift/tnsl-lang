#!/bin/bash

echo $1

../tint -in tnslc.tnsl -flags "$1"
