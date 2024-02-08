# tnslc

The reference compiler for the TNSL programming language.  The compiler is written in TNSL.

## Usage:

Place the interpreter `tint` in the parent folder and execute `run.sh` with the argument being the flags for the compiler.
The compiler outputs x86 NASM compatible assembly.

Examples:
- `./run.sh dummy.tnsl` - Run the compiler on the dummy file
- `./run.sh "dummy.tnsl ../libtnsl/libtnsl.tnsl"` - Run the compiler on the dummy file but also link libtnsl

- `.\run.ps1 hello.tnsl`: Run the compiler on the sample "Hello World" program

## License

	This Source Code Form is subject to the terms of the Mozilla Public
	License, v. 2.0. If a copy of the MPL was not distributed with this
	file, You can obtain one at http://mozilla.org/MPL/2.0/.
