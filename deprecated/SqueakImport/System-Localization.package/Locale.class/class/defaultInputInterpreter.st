platform specific
defaultInputInterpreter
	| platformName osVersion |
	platformName := Smalltalk platformName.
	osVersion := Smalltalk getSystemAttribute: 1002.
	(platformName = 'Win32' and: [osVersion = 'CE']) 
		ifTrue: [^NoInputInterpreter new].
	platformName = 'Win32' ifTrue: [^MacRomanInputInterpreter new].
	^NoInputInterpreter new