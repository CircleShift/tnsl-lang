Version 0.0.1
# The TNSL Language Specification

## Forward

As of writing this forward, TNSL is not even a language yet.  Right now, it's mostly just a stupid idea that I've devoted too much brain-space to, and I'm not confident will ever take off.  The hard-core C folk will probably write it off, as well as the new-fangled rust/golangers with all their type safety.

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
	- libtnsl
	- TNSL-lang export trees (T-LETs)

3. The TNSL Calling ABI

	- Differences from C
	- Exporting C-like Functions
	- Types and Arrays in Memory

4. Features in Position

	- Bare Metal
	- `libtnsl` as it relates to Types
	- Cross Calling to C

- Appendix A - Reserved Characters
- Appendix B - Reserved Words
- Appendix C - Speed vs the Type System

## Credits

	Copyright 2021 Kyle Gunger

	This file is licensed under the CDDL 1.0 (the License)
	and may only be used in accordance with the License.
	You should have received a copy of the License with this
	software/source code. If you did not, a copy can be found
	at the following URL:

	https://opensource.org/licenses/CDDL-1.0

	THIS SOFTWARE/SOURCE CODE IS PROVIDED "AS IS" WITH NO
	WARRANTY, GUARANTEE, OR CLAIM OF FITNESS FOR ANY PURPOSE
	EXPRESS OR IMPLIED
