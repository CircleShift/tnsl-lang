# tnslc

The reference compiler for the TNSL programming language.  The compiler is written in TNSL.

## Usage:

Place the interpreter `tint` in the parent folder and execute `run.sh` with the argument being the flags for the compiler.
The compiler outputs x86 NASM compatible assembly.

Examples:
- `./run.sh dummy.tnsl` - Run the compiler on the dummy file
- `./run.sh "dummy.tnsl ../libtnsl/libtnsl.tnsl"` - Run the compiler on the dummy file but also link libtnsl

- `.\run.ps1 tnslc_wrapped.tnsl`: Run the compiler on the sample "Hello World" program

### Credits

	Copyright 2021-2022 Kyle Gunger

	This file is licensed under the CDDL 1.0 (the License)
	and may only be used in accordance with the License.
	You should have received a copy of the License with this
	software/source code. If you did not, a copy can be found
	at the following URL:

	https://opensource.org/licenses/CDDL-1.0

	THIS SOFTWARE/SOURCE CODE IS PROVIDED "AS IS" WITH NO
	WARRANTY, GUARANTEE, OR CLAIM OF FITNESS FOR ANY PURPOSE
	EXPRESS OR IMPLIED
