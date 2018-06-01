as yet unclassified
inputInterpreterClass
	| platformName  |
	platformName := Smalltalk platformName.
	platformName = 'Win32'
		ifTrue: [^UTF32RussianInputInterpreter].
	platformName = 'Mac OS'
		ifTrue: [^ (('10*' match: Smalltalk osVersion)
					and: [(Smalltalk getSystemAttribute: 3) isNil])
				ifTrue: [MacUnicodeInputInterpreter]
				ifFalse: [MacRomanInputInterpreter]].
	platformName = 'unix'
		ifTrue: [^ UTF32RussianInputInterpreter].
	^ MacRomanInputInterpreter