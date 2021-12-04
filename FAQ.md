# FAQ
(Not really, as if I get questions about this terrible project.)

- Q: The syntax of this language makes me want to bleach my eyes and never program again.
	- A: Yes

- Q: Your code looks really crappy.  I bet it has a lot of bugs.
	- A: Yes

- Q: X language is better.
	- A: Probably

- Q: Where did you come up with the syntax for this?
	- A: When I was in my contrarian phase (not saying I'm not still in this phase) I got really into creating a programming language contrary to other languages. Funny enough, I was (and am) kinda pseudo-contrarian, so the language has a lot of similarities to those languages as well. This language:
		- Has line beginnings instead of endings (because of course it does)
		- Has a type system somewhere between C, C++, and Golang
		- Has a very limited pre-processor
		- Doesn't have header files

- Q: This feels like a wierd cross of C, C++, and some other language I can't quite define.
	- A: That makes sense.  I first programmed in Java, moving to JS, Golang, and C afterwards.  The roots of this lang stem from those languages, even if it looks nothing like them.

- Q: Does this language have *any* advantage over those previously listed?
	- A: Not really.  It is a programming language after all.  Anything you can do here, those other languages probably provide.

- Q: Do you even like this thing?
	- A: I've kinda grown to love it, actually.  It's pretty satisfying to feel like I *completely* understand how a language is supposed to work.  Also, programming in your own language gives you a bit of an ego boost.

- Q: So really, what do you like about this thing that other languages don't provide?
	- A: TNSL *very rarely* uses a reserved character for more than one purpose.  For characters that do have more than one purpose, the purposes are either functionally identical or extremely related.  This makes it rare that a user would run into syntax that is hard to understand. Also:
		- The limited type system provides either fine or loose control depending on your use case (read the docs for more info about `structs`)
		- Lack of headers make code less redundant and confusing (for me)
		- The language attempts to cram a limited and useful set of high-level features into any environment assuming that a standard library exists to support those features.
		- Even though there is the *option* to use high level features, a programmer can very easily use none and instead favor fine control over memory and types akin to C or C++.
		- The standard library actually provides some control over how the language functions, so it can be adapted for many environments without compilation failure.
		- Similar to go, tnsl provides support for multiple return values.

- Q: I actually kinda like this
	- A: Thanks!  Feel free to report bugs or submit pull requests (as long as you are willing to publish that code under the same licence as this repo).