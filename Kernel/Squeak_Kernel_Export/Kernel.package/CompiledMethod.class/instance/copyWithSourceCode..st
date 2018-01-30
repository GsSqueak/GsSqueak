source code management
copyWithSourceCode: sourceCode
	"Create a copy of the receiver whose source is embedded in the method.  Used for breakpoints."
	^self copyWithTrailerBytes: (CompiledMethodTrailer new sourceCode: sourceCode)