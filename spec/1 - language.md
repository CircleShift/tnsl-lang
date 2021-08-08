# The Language

## Section 1 - Files

### Folder Structure

TNSL project structure has a root source folder with TNSL files contained within the folder and sub-folders.  There is no strictly enforced system, but the standard organization is to place code sub-modules in sub-folders, and name the module entry point file the same name as its enclosing folder.

The main file to compile is known as the root file, which generally resides in the root source folder.  This file will contain either a main method, or the pre-processor statement `rootfile` to denote the root of a library.  A main file may contain both.

### TNSL Files

TNSL files contain the .tnsl extension and contain one or more of the following:
- Comments
- Pre-processor statements
- Modules
- Named function blocks
- Method and interface blocks
- Constant, variable, and type definitions

TNSL files may only contain the following enclosed in function blocks:
- Re-assignment of variables
- Control flow blocks
- Use of variables in definition of variables
- Function calls

## Section 2 - Blocks

### TNSL Block Notation

Blocks in tnsl consist of a slash and a character denoting the type of block as opening, and the inverse of these symbols as closing.  The three types of blocks are comment, pre-processor, and code.  Code blocks can be further broken down into modules, functions, methods, and control blocks.

	Examples of standard block opening and closing characters:

	/# - open comment
	#/ - close comment

	/: - open pre-processor
	:/ - close pre-processor

	/; - open code
	;/ - close code

In addition to the standard opening and closing characters, there exist "swivle" character sets to quickly close and re-open a block type

	;; - close code, then open code
	#; - close comment, open code
	;# - close code, open comment
	:: - close pre-processor, open preprocessor
	#: - close comment, open pre-processor
	:# - close pre-processor, open comment

Code blocks may have inputs and/or outputs.  Inputs are enclosed by `()` and outputs are enclosed by `[]`

Usage examples:

	# This is a line comment

	/#
		This is a block comment, the next block is a module named "my_module",
		it contains one function named "my_function" with no inputs or
		outputs.
	#/

	/; module my_module
		
		/##
			This is a documentation comment, notice the two #s at the
			beginning of the block instead of just one.

		#; my_function
		
		;/
	;/

### Modules

Modules are to TNSL what namespaces are to c++, a way to contain a group of related functions, types, methods, and other namespaces such that they won't interfere with outside code.  Modules may only be accessed (by other programs) if they are exported using the `export` keyword when defining the module.  Modules contained within the module (Sub-modules) are not automatically exported, and must also use the keyword if they wish to be accessable by other programs.  Unexported modules may still be used within the project from which they originate.

### Module definition example:

*File a.tnsl (project a)*

	/; export module my_module
		/; module my_hidden_module
			# Can access all from my_module, and my_hidden_module
		;/
		# Can access all from my_module, and my_hidden_module
	;/
	# Can access all from my_module, and my_hidden_module

*File b.tnsl (project b)*

	/; my_function
		# Can access all from my_module, but not from my_hidden_module
	;/
	# Can access all from my_module, but not from my_hidden_module

### Functions

TNSL functions are 

### Control Flow Blocks

### Anonymous Blocks

## Section 3 - Statements

### TNSL Statement Notation

### Variable Declaration

### Assignment

### Special Statements

## Section 4 - Types

### Built-in Types

### The Void Type

### Arrays

### Pointers

### Defining Types

### Interfaces

### Type Levels

## Section 5 - Operators

### Operator Presedence

## Section 6 - `raw` and `asm`

### The `raw` Keyword

### The `asm` Keyword

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