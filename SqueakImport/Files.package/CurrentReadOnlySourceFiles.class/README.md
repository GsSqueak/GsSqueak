I'm useful to avoid the creation of several read-only copies of the source files. Use me instead of SourceFiles in your code when you need a read-only copy, like here:

CurrentReadOnlySourceFiles at: 1.

To reuse the source files, surround your code the following way:

CurrentReadOnlySourceFiles cacheDuring: [
	<your code here using CurrentReadOnlySourceFiles> ]

Note that it's still better performance wise to store the source files in a variable in your code if you need them more than once, than throwing many exceptions.