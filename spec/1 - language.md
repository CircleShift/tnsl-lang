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

*File aa.tnsl (project a)*

	/; my_function_a
		# Can access all from my_module, and my_hidden_module
	;/
	# Can access all from my_module, and my_hidden_module

*File b.tnsl (project b)*

	/; my_function
		# Can access all from my_module, but not from my_hidden_module
	;/
	# Can access all from my_module, but not from my_hidden_module

### Functions

TNSL functions are code blocks whose definition contains none of the following: control flow keywords, the module keyword, the method keyword.  TNSL functions are called methods if they are contained within a method block.  TNSL methods may only be called with relation to the user defined type they are linked to.  If a TNSL function has no user defined name, it is anonymous.  Anonymous funtions can be stored as void type variables or called immediately.  If an anonymous function is not stored, it is interperated as inline and called immediately (this is known as a scope block).

TNSL functions may have inputs (enclosed with `()`) and/or outputs (enclosed with `[]`).  Inputs must be named; naming outputs is optional.

TNSL functions may have their call stack modified by the `raw` and/or `inline` keywords.  If the `inline` keyword is placed around the function declaration, the function will still be exported (if it is being exported), but any time it is used in the project's code, it will be optimized as if in-line.

The use of the `raw` keyword has several effects:  the function will have no generated assembly preamble, the function will not be optimized, and the function will allow `asm` statements.  Any function may be labeled `raw`, even `main` and anonymous functions.

Examples:

	# simple function with no inputs or outputs named "my_function"
	/; my_function
		<statements>
	;/

	# function with inputs and outputs
	/; my_second_function ( <type> input1, <type (optional)> input2 ) [ <type 1>, <type 2>, ... , <type n> ]
		<statements>
	;/

	# funtion calling an anonymous function
	/; my_third_function
		# an anonymous function (scope block)
		/;
			<statements>
		;/
	;/

### Control Flow Blocks

Control flow blocks are code blocks whose definitions contain the keywords if, else, loop, match, case, or default.

For if, else, loop, and match any inputs and/or outputs are a semicolon seperated list of statements.  For case or default, only inputs are accepted in the form of a single value.  Any variables defined in these inputs or outputs are scoped to the block only.  Control flow blocks may not actually output any values; instead, any statements in the output are evaluated when the block ends, weather it loops or not.

Examples:

	# simple if block
	/; if ( <statement resolving in boolean value> )
		<statements>
	;/

	# if block with else and else if
	/; if ( <statement (optional)> ; <statement (optional)> ; ... ; <statement resolving in boolean value> )
		<statements>
	;; else if ( <statement resolving in boolean value> )
		<statements>
	;; else
		<statements>
	;/

	# loop block
	/; loop ( <statement (optional)> ; ... ; <statement resolving in boolean value (optional)> )
		[ <statements to be evaluated on loop (optional)> ]

		<statements>
	;/

	# match block
	/; match ( <statement (optional)> ; ... ; <input value> )

		/; case <match value>
			<statements>
		;; case <match value>
			<statements>
			# Continue here would fall through to default
		;; default
			<statements>
		;/
	;/

## Section 3 - Statements

### TNSL Statement Notation

There are three types of tnsl statements: code, pre-processor, and comment.  Code statements begin with `;` and end at the next statement.  Pre-processor statements begin with `:` and end at the next statement.  Comment statements (line comments) begin with `#` and end at the next new line.  After a line comment ends, the previous statement resumes.

### Variable Declaration

Decalring a variable is done by referencing a type and then giving a list of names for the new variables.  Optionally, a list of values may be given to initialize the new variables.

Variables may be augmented by the following keywords: `const`, `volatile`, and/or `static`.

Declaring a variable as `const` means that it is a constant and must be imediately initialized.  A constand may not be re-assigned a value.

Declaring a variable as `volatile` means that the compiler will not attempt to optimize operations performed on it.

Declaring a variable `static` means that the value will be kept between function calls.  Static variables may create race conditions when paired with threads.

Examples:

	# list with initialization
	;int a, b = 0, 1
	
	# single without initialization
	;int c
	
	# list with partial initialization
	;int d, e = 0 # d is defined, but e is not

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

## Credits

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