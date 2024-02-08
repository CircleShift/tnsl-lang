Version 0.0.1
# The TNSL Language Specification

## Forward

As of writing this forward, TNSL is not even a language yet.  Right now, it's mostly just a stupid idea that I've devoted too much brain-space to, and I'm not confident will ever take off.  The hard-core C folk will probably write it off, as well as the new-fangled rust/golangers with all their type safety.

Right now, TNSL isn't a language.  But it *could* be.  And, really, I think it's a cool challenge to try to pack high-level features into a low-level environment.  I hope you find it interesting as well.

-Kyle

## Chapter Index

1. [The Language](./1.md)

	- Files
	- Blocks
	- Statements
	- Types
	- Operators
	- `raw` and `asm`

2. [Related features](./2.md)

	- Style guide
	- Compiler Options
	- The Pre-Processor
	- libtnsl
	- TNSL-lang export trees (T-LETs)

3. [The TNSL Calling ABI](./3.md)

	- Differences from C
	- Exporting C-like Functions
	- Types and Arrays in Memory

4. [Features in Position](./4.md)

	- Bare Metal
	- `libtnsl` as it relates to Types
	- Cross Calling to C

- [Appendix](./Appendices.md)
	- A: Reserved Characters
	- B: Reserved Words
	- C: Speed vs the Type System

## License

	This Source Code Form is subject to the terms of the Mozilla Public
	License, v. 2.0. If a copy of the MPL was not distributed with this
	file, You can obtain one at http://mozilla.org/MPL/2.0/.
