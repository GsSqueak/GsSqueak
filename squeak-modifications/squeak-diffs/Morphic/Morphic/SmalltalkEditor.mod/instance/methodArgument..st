private
methodArgument: anInteger 
	^ (ReadStream on: self text asString) nextLine
		ifNil: [ String empty ]
		ifNotNilDo:
			[ : line | 
			line substrings
				at: 2 * anInteger
				ifAbsent: [ String empty ] ]