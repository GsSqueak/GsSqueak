query
allCallsOn: aLiteral fromBehaviors: behaviors sorted: sorted
	"Answer a collection of all the methods implemented by behaviors that call on aLiteral even deeply embedded in literal arrays."
	
	| result |
	result := OrderedCollection new.
	CompiledCode
		scanBlocksForLiteral: aLiteral
		do: [:primaryScanner :secondaryScanner | | thorough |
			"Possibly search for literals embedded in literal arrays or pragmas, etc."
			thorough := self class thoroughSenders.
			behaviors do:
				[ :behavior |
				behavior selectorsAndMethodsDo:
					[ :selector :method |
					(method
							refersTo: aLiteral
							primaryBytecodeScanner: primaryScanner
							secondaryBytecodeScanner: secondaryScanner
							thorough: thorough) ifTrue:
						[result addLast: (MethodReference class: behavior selector: selector)]]]].
	sorted ifTrue:
		[result sort].
	^result