# tnslc

The reference compiler for the TNSL programming language.  The compiler is written in TNSL.

## Usage:

Place the [bootstrap compiler](https://git.cshift.net/CircleShift/ctc) `ctc` in this folder and execute `build.sh`
The compiler outputs x86 NASM compatible assembly.

Examples:
- `./ctc dummy.tnsl dummy.asm` - Run the bootstrap compiler on the dummy file, output to dummy.asm
- `./build.sh` - Build the compiler

## License

	This Source Code Form is subject to the terms of the Mozilla Public
	License, v. 2.0. If a copy of the MPL was not distributed with this
	file, You can obtain one at http://mozilla.org/MPL/2.0/.
