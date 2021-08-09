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

TNSL files may only contain the following enclosed in function or method blocks:
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

In addition to the standard opening and closing characters, there exist "swivel" character sets to quickly close and re-open a block type

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

Modules are to TNSL what namespaces are to c++, a way to contain a group of related functions, types, methods, and other namespaces such that they won't interfere with outside code.  Modules may only be accessed (by other programs) if they are exported using the `export` keyword when defining the module.  Modules contained within the module (Sub-modules) are not automatically exported, and must also use the keyword if they wish to be accessible by other programs.  Unexported modules may still be used within the project from which they originate.

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

TNSL functions are code blocks whose definition contains none of the following: control flow keywords, the module keyword, the method keyword.  TNSL functions are called methods if they are contained within a method block.  TNSL methods may only be called with relation to the user defined type they are linked to.  If a TNSL function has no user defined name, it is anonymous.  Anonymous functions can be stored as void type variables or called immediately.  If an anonymous function is not stored, it is interpreted as inline and called immediately (this is known as a scope block).

TNSL functions may have inputs (enclosed with `()`) and/or outputs (enclosed with `[]`).  Inputs must be named; naming outputs is optional.

TNSL functions may have their call stack modified by the `raw` and/or `inline` keywords.  If the `inline` keyword is placed around the function declaration, the function will still be exported (if it is being exported), but any time it is used in the project's code, it will be optimized as if in-line.

The use of the `raw` keyword has several effects:  the function will have no generated assembly preamble, the function will allow `raw return` statements, the function will not be optimized, and the function will allow `asm` statements.  Any function may be labeled `raw`, even `main` and anonymous functions.

Functions *may* be overloaded (that is, two functions may share names but have differing input type lists).  Overloaded functions *may not* share the same inputs and differing outputs, but *may* have both differing inputs and differing outputs.

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

For if, else, loop, and match any inputs and/or outputs are a semicolon-separated list of statements.  For case or default, only inputs are accepted in the form of a single value.  Any variables defined in these inputs or outputs are scoped to the block only.  Control flow blocks may not actually output any values; instead, any statements in the output are evaluated when the block ends, weather it loops or not.

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

Declaring a variable is done by referencing a type and then giving a list of names for the new variables.  Optionally, a list of values may be given to initialize the new variables.

Variables may be augmented by the following keywords: `const`, `volatile`, and/or `static`.

Declaring a variable as `const` means that it is a constant and must be immediately initialized.  A constant may not be re-assigned a value.

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

An exhaustive list of built-in types can be found in Appendix B.

### The `void` Type

The `void` type represents one of two things: an unknown data type, or a function.  When the void type is paired with input and output parameters `void( <types> )[ <types> ]` it represents a function.  When it is not paired with these things it represents an unknown data type.

Pure `void` types can not be created.  Function types are *always* references to the function, more like pointers than data holders.  Otherwise, void types must be created as pure pointers.  In this case, they are in a sense "un-typed" pointers which do not know the length of the object they are pointing at, only the address.

Examples:

	# simple function
	/; func_1
	;/

	# void example func
	/; func_2

		# create a void type and assign it func_1's value
		;void()[] func_ref = func_1
		
		# call func_1 using func_ref
		;func_ref()
	;/

More examples of pointer voids are available in the pointers section of this document.

### Arrays

In memory, arrays store their length as a uint, then immediately follow with the contents of the array.  This way, all arrays can be checked for length with the `len` operator.

Arrays are created by prefixing a type with `{ <# of elements> }` or simply `{}` so long as the array is immediately initialized.  One can similarly access an element of an array by suffixing the variable name with `{ <value of element to return> }`.

When initializing or assigning a new value to an entire array, use `{}` to encase a list of values.

The length of the array can be gotten by `len <variable name>`

Examples:

	# create an array of five integers
	;{5}int i

	# assign values to the array
	;i{0} = 0
	;i{1} = 2
	;i{2} = 0
	;i{3} = 2
	;i{4} = 1

	# store the length of the array
	;uint array_length = len i

	# create an initialized array with length five
	;{}int j = {1, 2, 3, 4, 5}

	# loop through the array and add them.
	/; loop (int k = 0; k < array_length) [k++]

		;i{k} += j{k}
	;/


### Pointers

Pointer types are created using the `~` (pointer to) operator.  This operator serves as both part of the type, and as a way to get a pointer from a type.  To de-reference a pointer into it's base type, use the `` ` `` (de-reference) operator.

Passing by reference can be done by prefixing the type with the de-reference operator.  This type is only available in function parameter declaration.  To call a function with this type, a pointer to the desired variable must be given.

Examples:

	# define int
	;int i

	# pointer to i
	;~int p = ~i

	# set i using p
	;`p = 1

	# a function taking a pass by reference
	/; add_two (`int i)
		i += 2
	;/

	# calling add_two in two different ways
	;add_two(p)
	;add_two(~i)

	# i is now 5

### Casting Types

Casting between types uses the standard input and output enclosing `()` and `[]` in conjunction.  Place a value in the input enclosing characters and a type to output in the output enclosing characters to cast one type to another (`( <value> )[ <type> ]`).

Examples:

	# define an int and a float
	;int i = 10
	;float f = 11.5

	# define a void pointer and set it to reference i
	;~void v = ~i
	
	# define an int pointer and cast the void pointer to initialize it
	;~int p = (v)[~int]

	# cast the float to an int and set the value of i
	;`p = (f)[int]

### Defining Types

In TNSL, types may be defined by using the `struct` keyword.  Struct must be used in conjunction with a user defined name and a set of members enclosed in `{}`.  Instances of struct types may be larger than their members if not declared `raw` due to type information and extension.  Certain restrictions must be applied to `raw` types.  These restrictions may be found in Appendix C.

Types may extend other types and interfaces with some caveats.  Raw structs may not extend other structs, but may extend interfaces.  Non-raw structs may not extend raw structs.  If extending two or more structs, they may not have any conflicting member names.

Methods may be added to a struct with the `method` block.  Immediately following `method` must be the user defined name of the struct.

Methods may use the `override` or `operator` keywords in function definition.  `override` must be used for functions which are named and typed equivalently to extended classes' methods.  `operator` allows types to use operators as methods, the keyword must immediately be followed by the operator to overload, and must only have up to one input depending on weather the operator is binary or not.

Methods may access the special keywords `self` and `super`.  `self` is a reference to the instance of the struct that the function was called on.  `super` is a reference to any structs or interfaces extended by the struct.  If there is only one extended type, it references the methods of that type.  Otherwise, it is an array of such objects.  It may be called to call the equivalent method on the extended type.  `super` may also be used in the member set to position the extended types' members in relation to the new struct's members.

Examples:

	# normal struct
	; struct box {
		float
			x,
			y,
			z
	}

	# method block
	/; method box

		/; area [float]
			return self.x * self.y * self.z
		;/
	;/

### Interfaces

Interfaces are defined using the `interface` keyword.  Interfaces have methods but no struct or members to accompany them.  Instances of interfaces may not be created.  Methods defined by interfaces must be overridden unless marked in the interface.  Such marked methods may call on other methods, but may not use any members as interfaces have none.

Example:

	/; interface shape

		/; area [float] ;/

		# this method does not need to be overridden
		/; override area_sq [float]
			;float a = self.area()
			;return a*a
		;/
	;/

	;struct box extends shape {
		float
			x,
			y,
			z
	}

	/; method box

		/; override area [float]
			;return x*y*z
		;/
	;/

### Enums

Enums are defined using the `enum` keyword.  An enum represents a set of possible states, and requires a single output type which can be compared.

Enums may be defined in conjunction with the `raw` keyword.  When defined in this way, each state is mutually exclusive and must be represented by a single bit of a uint type.  Raw enums may be thought of more akin to bit-masks.

Examples:

	# non-raw enums must define each value
	; enum color [int] {
		# In standard styling, these use UPPER_SNAKE_CASE
		RED = 1,
		BLUE = 2,
		...
		YELLOW = 12
	}

	# raw enums may not define any value
	; raw enum object_material {
		WOOD,
		METAL,
		GLASS,
		PLASTIC,
		...
		ROCK
	}

## Section 5 - Operators

An exhaustive list of operators can be found in Appendix A

### Operator Precedence

Operator precedence is as follows (from greatest to least):

	Pointer operators (p0):
	
	~ - address of
	
	` - de-reference


	Access operator (p1):

	. - get/access


	Increment/de-increment (p2):

	++ - increment

	-- - de-increment


	Multiplication/division (p3):

	* - multiply

	/ - divide


	Addition and subtraction (p4):

	+ - addition

	- - subtraction


	Modulus (p5):

	% - modulus


	Bitwise operators (p6):

	& - and

	| - nor

	^ - xor

	<< - shift left
	
	>> - shift right

	!& - nand

	!| - nor

	!^ - xand

	! - not (bitwise or boolean)


	Boolean operators (p7):

	&& - boolean and

	|| - boolean or

	== - boolean eq

	> - greater than

	< - less than
	
	!&& - boolean nand

	!|| - boolean nor

	!== - boolean neq

	!> - boolean not greater than

	!< - boolean not less than

	>== - boolean greater than or equal to

	<== - boolean less than or equal to

## Section 6 - `raw` and `asm`

### The `raw` Keyword

The `raw` keyword can be used in four different scenarios, and each has a different meaning.

1. The `raw` keyword can be used in function definitions.  These effects were discussed in section 2.2.

2. The `raw` keyword may be used in conjunction with the `return` keyword, but only inside of raw functions.  This causes an instant return regardless of stack or register state.  It is recommended to clean up function and provide return types before using this.

3. The `raw` keyword may be used with the `struct` keyword to create a raw struct.  Raw structs can not contain user defined types or generics.  Raw types encode no type information and may not be extended.  Raw structs, unlike static or dynamic structs, are only as wide their members.
	- Static and dynamic structs contain a small amount of information pertaining to their actual type and generics so may be larger than only their members.
		- In addition, since static and dynamic structs may be extended, they may not be the initially defined type and may be larger, further complicating matters.

4. The `raw` keyword may be used with the `enum` keyword to create a raw enum.  Raw enums only have at most one state per bit and may bitwise or and bitwise and to generate a full state.  Raw enums are much akin to bit-masks.

### The `asm` Keyword

The `asm` keyword may be used in `raw` functions or blocks to produce raw asm code for the assembler.  Any valid assembly code may be used, and certain extensions are available such as variable pointer references.

Syntax:

	;asm "<valid line of assembly code>"

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