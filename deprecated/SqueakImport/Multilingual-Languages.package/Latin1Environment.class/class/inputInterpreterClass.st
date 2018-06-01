subclass responsibilities
inputInterpreterClass
	| platformName osVersion |
	platformName := Smalltalk platformName.
	osVersion := Smalltalk osVersion.
	(platformName = 'Win32' and: [osVersion ~= 'CE'])
		ifTrue: [^ (self win32VMUsesUnicode) ifTrue: [UTF32InputInterpreter] ifFalse: [MacRomanInputInterpreter]].
	platformName = 'Mac OS'
		ifTrue: [^ MacUnicodeInputInterpreter].
	platformName = 'unix'
		ifTrue: [^ UTF32InputInterpreter].
	^ MacUnicodeInputInterpreter