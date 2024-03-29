# Appendices

## Appendix A - Reserved characters and their uses

### A.1 - Single reserved characters

	Delimiters:

	( - start of input list (functions, control flow, and types)
	
	) - end of input list

	[ - start of output list (functions, control flow)
	
	] - end of output list

	{ - start of array/data set list (arrays, types)
	
	} - end of array/data set list


	Statement seperators:

	; - beginning of statement, end of previous statement

	: - beginning of pre-processor statement, end of previous

	# - line comment, ends at newline


	In-line sepreator:

	, - seperates argument lists


	"Augmentation" characters (operators):

	= - assignment operator

	. - get/access operator

	& - bitwise and

	| - bitwise or

	^ - bitwise xor

	> - greater than

	< - less than

	! - not (can also prefix any bitwise or boolean operator)

	+ - addition

	- - subtraction

	* - multiplication

	/ - division

	% - modulus

	~ - address of (pointer)

	` - de-reference pointer

### A.2 - Multi reserved characters

	Delimiters:

	/; - start of code block

	;/ - end of code block

	/: - start of pre-processor block

	:/ - end of pre-processor block

	/# - start of comment block

	#/ - end of comment block

	;; - re-define code block (end previous code block and open new code block)

	#; - re-define comment to code block

	;# - re-define code to comment block

	:: - re-define pre-processor block

	#: - re-define comment to pre-processor block

	:# - re-define pre-processor to comment block


	Augmentation character sets:

	== - boolean equals

	&& - boolean and

	|| - boolean or

	<< - bit-shift left
	
	>> - bit-shift right

	&= - bitwise and assignment expansion (x &= y -> x = x & y)

	|= - bitwise or assignment expansion

	^= - bitwise not assignment expansion

	+= - addition assignment expansion

	-= - subtraction assignment expansion

	*= - multiplication assignment expansion

	/= - division assignment expansion

	%= - modulus assignment expansion

	~= - address of assignment expansion

	`= - de-reference assignment expansion

	!& - bitwise nand

	!| - bitwise nor

	!== - boolean neq

	!&& - boolean nand

	!|| - boolean nor

	!> - not greater than

	!< - not less than

	>== - greater than or equal to

	<== - less than or equal to

	++ - increment

	-- - de-increment

## Appendix B - Reserved words and their uses

	Built-in Types:

	bool - boolean

	int8 - 8-bit integer

	int16 - 16-bit integer

	int32 - 32-bit integer

	int64 - 64-bit integer

	int - the default-width integer

	uint8 - 8-bit unsigned integer (also used to store byte-width characters)

	uint16 - 16-bit unsigned integer (also used to store word-width characters)

	uint32 - 32-bit unsigned integer

	uint64 - 64-bit unsigned integer

	uint - the default-width unsigned integer

	float32 - floating point number (32-bit)

	float64 - floating point number (64-bit)

	float - the default-width floating point number

	void - void type

	type* - meta type (tnsl.reflect._type)

	vect* - (tnsl.box._vect) type

	
	Values:

	true - boolean true value

	false - boolean false value

	size - size (in bytes) of a variable or type

	len - size (in elements) of an array

	null - represents a broken pointer.  This value only has context for pointers and is defined as a ~void.


	User defined types:

	struct - define a struct

	interface* - define an interface

	enum - define an enum

	extends* - extends a struct or interface

	is* - checks if the variable's type is or extends another type (tnsl.reflect._is)

	method - creates a block of type-associated functions


	Control flow:

	if - define a conditional code block, or use after "else" to define an "else if" block

	else - code which runs if and only if an if block is not taken

	loop - begin a loop block

	continue - skip the rest of the code in the top-most loop block

	break - break out of a loop or match block

	match - match a variable to a value

	case - code to run in case of a value match in a match block

	default - code to run in the case of no match in a match block

	label - defines an in-function label to jump to from another part of code

	goto - jump to a previously defined label


	Modifier keyewords:

	const - marks a variable as constant

	volatile - marks a variable so any operations on it will not be optimized by the compiler

	static - marks a variable to keep value between function calls

	raw - strips down the calling conventions as they relate to normal functions.  See Appendix C as it relates to structs

	inline - puts the function code inline and optimizes as such when compiling.  If exported, still creates a block for reference by external code.

	
	Method modifiers:

	override* - override a method from the struct's super type

	self - reference to the struct the method was called on

	operator - define a method for when a reserved opertaor is used on a user defined struct

	super* - can reference the method of an extended type or interface


	Modules:

	module - a related group of functions, types, and sub-modules

	export - allows the module to be referenced by outside projects, and puts the module into the symbol tree of the binary (if one exists)


	Memory control:

	alloc* (and related) - allocate (or reallocate) memory from somewhere (tnsl.algo._alloc)

	dealloc* (and related) - free allocated memory (tnsl.algo._dealloc)

\* keyword requires a libtnsl implimentation

## Appendix C - Memory operations and code speed as it relates to user-defined types

In TNSL there exist three different levels of complexity structs can take on.  In this appendix these levels will be examined in order of least complex to most complex.

### Raw structs

Raw structs are the simplist structs with the fastest lookup times.  Raw structs can not be extended, though they may themselves extend interfaces (but not other structs).  All members of raw structs must be built-in types, other raw structs, or pointers.  Raw structs are always fixed-width and all methods are linked directly, thus there is no lookup time for calling one (they are essentially as fast as calling a regular function as long as you are referencing the struct directly and not by one of it's extended interfaces).

NOTE: Raw structs do not allow generics

### Static structs

Static structs are similar to raw structs except they may be extended.  This creates a small delay for calling functions on static structs as there is a lookup time to find the method the call is actually referencing (as it may be calling the function on an extension of the type).  All members of static structs must be built-in types, other raw structs, or pointers.  Static structs can only extend static structs.

NOTE:  Static structs *can* allow generics so long as they do not store said generics and only store pointers to them.

### Dynamic structs

Variable width structs (dynamic structs) can accomodate generics and variable width members.  Dynamic structs may extend static structs or other dynamic structs.  By extending a dynamic struct, even if one makes no use of the dynamic members, their struct is automatically a dynamic struct.  These structs offer the least control over memory, and slightly slower call times, but offer the most flexability to the programmer.


## Appendix D - UN7+1

Unicode Non-standard 7+1 bit (UN7+1) encoding is a non-standard way to represent any unicode character using a series of 8-bit values.  The first bit in the 8-bit sequence represents if the next 8-bit sequence is included in the character code, the other seven bits are part of the character code.

Examples:

	ASCII characters:
	0xxxxxxx (U+00 - U+7F)

	Unicode characters:
	1xxxxxxx 0xxxxxxx                   (U+0080 - U+3FFF)
	1xxxxxxx 1xxxxxxx 0xxxxxxx          (U+004000 - U+1FFFFF)
	1xxxxxxx 1xxxxxxx 1xxxxxxx 0xxxxxxx (U+0200000 - U+FFFFFFF)
	etc.
	
## License

	This Source Code Form is subject to the terms of the Mozilla Public
	License, v. 2.0. If a copy of the MPL was not distributed with this
	file, You can obtain one at http://mozilla.org/MPL/2.0/.