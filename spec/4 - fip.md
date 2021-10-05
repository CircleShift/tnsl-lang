# Features in Position

To use higher level features in TNSL, an implimentation of libtnsl must be in place with a minimum set of features.  This document outlines what concepts are and are not considered "higher level".  This document also covers what the minimum set of features are for a given implimentation of libtnsl.  Finally, this document covers how to call between TNSL and other programming languages.

## Section 1 - Bare Metal

## Section 2 - libtnsl and Types

`libtnsl` has the authority to define how types are stored in memory (to some extent) and how method resolution works on static and dynamic structs.  `libtnsl` *must* provide certain methods for some language features to be available.  These functions, and their uses are now listed, but a comprehensive list of language keywords can be found in Appendix B.

### 2.1 - The libtnsl Type Extension

`tnsl.reflect._type` *must* be defined as a raw struct which contains minimum information for type identification.  This information is stored with every static or dynamic struct so that programs can reflect type information.

`tnsl.reflect._member` *must* be defined as a raw struct which contains minimum information for member variable identification within a type.  The information need not be stored with every member variable, but should be stored somewhere such that the `tnsl.reflect._get` method can make use of it.

`tnsl.reflect._method` *must* be defined as a raw struct which contains minimum information for method identification within a type.  The information need not be stored with every member function, but should be stored somewhere such that the `tnsl.reflect._call` method can make use of it.

`tnsl.reflect._is` *must* be defined as a function taking two parameters of type `tnsl.reflect._type` and returning a single `bool` as output.  This function is called when the `is` operator is envoked.

`tnsl.reflect._get` *must* be defined as a function taking three parameters.  The first parameter will be of type `tnsl.reflect._type`, the second parameter will be of type `~void`, and the third parameter will be of type `tnsl.reflect._member`.  The function will return a single `~void` as output.

In the parameters, the first relates to the type of the struct given, or at least how the callee views the struct.  The second is a pointer to the struct itself.  The third is the requested member to get.  The `~void` returned must point to the requested value.

`tnsl.reflect._call` *must* be defined as a function taking four parameters.  The first parameter will be of type `tnsl.reflect._type`, the second parameter will be of type `~void`, the third parameter will be of type `tnsl.reflect._method`, and the fourth parameter will be of type `~void`.  The function will return a single `~void` as output.

In the parameters, the first relates to the type of the struct given, or at least how the callee views the struct.  The second is a pointer to the struct itself.  The third is the requested method to call.  The fourth is a pointer to the parameters for the method.  The `~void` returned must point to the return value of the method.

### 2.2 - Memory allocation and de-allocation

`tnsl.algo._alloc` *must* be defined as a function taking a single parameter of type `uint` as the number of bytes to allocate and returning a single `~void` as the pointer to the allocated memory.  The memory must be allocated from the heap.

`tnsl.algo._salloc` *should* be defined as a function taking a single parameter of type `uint` as the number of bytes to allocate and returning a single `~void` as the pointer to the allocated memory.  The memory must be allocated from the stack.

`tnsl.algo._dealloc` *must* be defined as a function taking a single parameter of type `~void` as the pointer to a chunk of allocated memory.  The function should deallocate the memory.

### 2.3 - Extra Types Extension

`tnsl.box._vect` *must* be a raw struct which vector or simd instructions can be preformed on.

`tnsl.box._string` *must* be a raw struct which stores a string of text.  This text may be ASCII or Unicode, but reguardless must be stored as `charp` values internally.

## Section 3 - Cross calling C

### Credits

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