# libtnsl

The official implimentation of the TNSL Standard Library

libtnsl provides the following language features:
* Type and method resolution
* Basic input and output
* Standard algorithms
* Standard data containers
* Basic platform identification
* Time resolution

More information on these features can be found in the specification under libts.txt

---
## Provided Sub-modules

libtnsl provides the tnsl base module and the following sub-modules to address each feature:
* algo
  * Common algorithms
* box
  * Data containers (vector, map, etc.)
* io
  * Input and output
* reflect
  * Type reflection and method resolution
* time
  * Time related functions

Each sub-module should have its own README to address features

---
	Copyright 2021 Kyle Gunger

	Dual licensed under the CDDL 1.0 and BSD 3-Clause licenses.

	This file may only be used in accordance with one of the two
	licenses.  You should have received a copy of each license with
	the source code.  In the event that you did not recieve a copy
	of the licenses, they may be found at the following URLs:

	CDDL 1.0:
	https://opensource.org/licenses/CDDL-1.0

	BSD 3-Clause:
	https://opensource.org/licenses/BSD-3-Clause

	THIS SOFTWARE/SOURCE CODE IS PROVIDED "AS IS" WITH NO
	WARRANTY, GUARANTEE, OR CLAIM OF FITNESS FOR ANY PURPOSE
	EXPRESS OR IMPLIED
