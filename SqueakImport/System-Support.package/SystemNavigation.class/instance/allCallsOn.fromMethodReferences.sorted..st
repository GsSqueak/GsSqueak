query
allCallsOn: aLiteral fromMethodReferences: methodReferences sorted: sorted
	"Answer a collection of all the methods implemented by behaviors that call on aLiteral even deeply embedded in literal arrays."
	
	| result |
	result := CompiledCode
				scanBlocksForLiteral: aLiteral
				do: [:primaryScanner :secondaryScanner | | thorough |
					"Possibly search for literals embedded in literal arrays or pragmas, etc."
					thorough := self class thoroughSenders.
					methodReferences select:
						[ :reference |
						reference compiledMethod
							ifNil: [false]
							ifNotNil:
								[:method|
								 method
									refersTo: aLiteral
									primaryBytecodeScanner: primaryScanner
									secondaryBytecodeScanner: secondaryScanner
									thorough: thorough]]].
	sorted ifTrue:
		[result sort].
	^result