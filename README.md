# tnsl-lang
This is the base repository for the tnsl language, and includes the standard compiler implementation, specification, and libtnsl implementation.  The specification and compiler are licenced under the CDDL-1.0 (LICENCE.md), while libtnsl is dual-licenced under both the CDDL-1.0 (LICENCE.md) and BSD-3-Clause (libtnsl/LICENCE-BSD3.md).

## tnsl specification

Under the folder `spec` is the TNSL language's specification.  It has been broken up into chapters in markdown format.  Any sub-folders are details on other related projects such as libtnsl (the standard library) and tnslc (the default compiler).

	Current specification version:
	0.0.1

## libtnsl

An implimentation of the TNSL standard library.  Dual licenced under the CDDL 1.0 and BSD 3-clause licences.

	Current focused portions of libtnsl (in order of importance):
	- Type reflection and implimentation
	- Stream operations (file, io, etc.)
	- Basic data containers

## tnslc

The standard TNSL compiler suite.  Contains a universal front end for producing ASTs and multiple backends for seperate ISAs.

	Focused ISAs at this time (in order of importance):
	- x86
	- arm64
	- risc-v

### Status

	Specification:    incomplete
	libtnsl:          incomplete
	tnslc:            incomplete

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