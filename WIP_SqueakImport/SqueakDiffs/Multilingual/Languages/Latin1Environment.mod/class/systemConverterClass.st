subclass responsibilities
systemConverterClass

	| platformName osVersion |
	platformName := Smalltalk platformName.
	osVersion := Smalltalk getSystemAttribute: 1002.
	(platformName = 'Win32'
			and: [osVersion = 'CE'])
		ifTrue: [^ MacRomanTextConverter].
	platformName = 'Win32'
		ifTrue: [^ (self win32VMUsesUnicode) ifTrue: [UTF8TextConverter] ifFalse: [ISO88591TextConverter]].
	platformName = 'Mac OS'
		ifTrue: [^ ('10*' match: Smalltalk osVersion)
				ifTrue: [UTF8TextConverter]
				ifFalse: [MacRomanTextConverter]].
	platformName = 'unix'
		ifTrue: [^ UTF8TextConverter].
	^ MacRomanTextConverter