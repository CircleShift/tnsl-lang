Version 0.0.1
# The TNSL Language Specification

## Forward

As of writing this forward, TNSL is not even a language yet.  Right now, it's mostly just a stupid idea that I've devoted too much brain-space to, and I'm not confident will ever take off.  The hard-core C folk probably will hate it, as well as the new-fangled rust/golangers with all their type safty.

I'm trying not to think too hard about that.

Right now, TNSL isn't a language.  But it *could* be.  And, really, I think it's a cool challenge to try to pack high-level features into a low-level environment.  I hope you find it interesting as well.

-Kyle

## Chapter Index

1. The Language

	- Files
	- Blocks
	- Statements
	- Types
	- Operators
	- `raw` and `asm`

2. Related features

	- Style guide
	- Compiler Options
	- The Pre-Processor
	- Included Tools

3. The TNSL Calling ABI

	- Differences from C
	- Link tables
	- Exporting C-like Functions
	- Types and Arrays in Memory

4. Features in Position

	- Bare Metal
	- `libtnsl` as it relates to Types
	- Cross Calling to C

### Credits

	Copyright 2021 Kyle Gunger

	This file is licenced under the CDDL 1.0 (the Licence)
	and may only be used in accordance with the Licence.
	You should have recieved a copy of the Licence with this
	software/source code. If you did not, a copy can be found
	at the following URL:

	https://opensource.org/licenses/CDDL-1.0

	THIS SOFTWARE/SOURCE CODE IS PROVIDED "AS IS" WITH NO
	WARRENTY, GUARANTEE, OR CLAIM OF FITNESS FOR ANY PURPOSE
	EXPRESS OR IMPLIED