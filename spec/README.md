# The TNSL Specification
Version 0.0.2

## Forward

This is mostly meant to be a collection of valid TNSL syntax that interested parties can use to learn the language by example.  Explanations are provided alongside.  In-depth explanations may be provided for features which use a bit of "compiler magic".  One goal of the language is to keep "compiler magic" to a minimum while still providing quality of life constructs for programmers to use, so these should be few.

Also, I forgot what TNSL stands for.  I now worry that it's one of those "ATM Machine" situations.

-CircleShift

## Chapter Index

1. [The Core Language](./1.md)
	- Files
	- Blocks
	- Types
	- Basic Statements
	- Operators
	- `asm`
    - Cross Calling to C

2. [Advanced Features](./2.md)
    - Relation to `libtnsl`
    - Generators and Coroutines
    - Streams
    - Anonymous Functions
    - Interfaces and Runtime Type Reflection

3. [Tweaking Features](./3.md)
	- Bare Metal
	- `libtnsl` as it relates to Types

4. [The TNSL Calling ABI](./4.md)
	- Differences from C
	- Exporting and importing C-like Functions
	- Types and Arrays in Memory

5. [Related Reading](./5.md)
	- Style guide
	- Compiler Options
	- The Pre-Processor
	- libtnsl
	- TNSL export trees (TETs)

- [Appendix](./Appendices.md)
	- A: Reserved Characters
	- B: Reserved Words
	- C: Speed of Advanced Features
    - D: When can I use [Feature]?
    - Z: UN7+1 (A unicode nonstandard format)

## License

	This Source Code Form is subject to the terms of the Mozilla Public
	License, v. 2.0. If a copy of the MPL was not distributed with this
	file, You can obtain one at http://mozilla.org/MPL/2.0/.
