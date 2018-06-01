*SqClasses-testing method dictionary
whichSelectorsReferTo: aLiteral thorough: thorough
	"Answer a set of selectors whose methods access the argument as a literal.
	 If thorough is true, then dives into the compact literal notation, and pragmas,
	 etc, making it slow but thorough "

	| who |
	who := IdentitySet new.
	CompiledCode
		scanBlocksForLiteral: aLiteral
		do: [:primaryScanner :secondaryScanner |
			self selectorsAndMethodsDo:
				[ :selector :method |
				(method
						refersTo: aLiteral
						primaryBytecodeScanner: primaryScanner
						secondaryBytecodeScanner: secondaryScanner
						thorough: thorough) ifTrue:
					[who add: selector]]].
	^who
