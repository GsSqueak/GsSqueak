testing
isLiteralSymbol: aSymbol 
	"Test whether a symbol can be stored as # followed by its characters. 
	Symbols created internally with asSymbol may not have this property,
	e.g. '3' asSymbol."
	| i ascii type next last |
	i := aSymbol size.
	i = 0
		ifTrue: [^ false].
	"TypeTable should have been origined at 0 rather than 1 ..."
	ascii := (aSymbol at: 1) asciiValue.
	type := TypeTable
				at: ascii
				ifAbsent: [^ false].
	type == #xLetter
		ifTrue: [next := last := nil.
			[i > 1]
				whileTrue: [ascii := (aSymbol at: i) asciiValue.
					type := TypeTable
								at: ascii
								ifAbsent: [^ false].
					(type == #xLetter
							or: [type == #xDigit
									or: [type == #xColon
											and: [next == nil
													ifTrue: [last := #xColon.
														true]
													ifFalse: [last == #xColon
															and: [next ~~ #xDigit
																	and: [next ~~ #xColon]]]]]])
						ifFalse: [^ false].
					next := type.
					i := i - 1].
			^ true].
	type == #xBinary
		ifTrue: [^ (2 to: i)
				allSatisfy: [:j | 
					ascii := (aSymbol at: j) asciiValue.
					(TypeTable
						at: ascii
						ifAbsent: [])
						== #xBinary]].
	type == #verticalBar
		ifTrue: [^ i = 1].
	^ false