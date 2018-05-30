as yet unclassified
inputInterpreterClass
	| platformName osVersion encoding |
	platformName := Smalltalk platformName.
	osVersion := Smalltalk osVersion.
	(platformName = 'Win32' and: [osVersion = 'CE']) 
		ifTrue: [^MacRomanInputInterpreter].
	platformName = 'Win32' ifTrue: [^WinKSX1001InputInterpreter].
	platformName = 'Mac OS' 
		ifTrue: 
			[('10*' match: osVersion) 
				ifTrue: [^MacUnicodeInputInterpreter]
				ifFalse: [^WinKSX1001InputInterpreter]].
	platformName = 'unix' 
		ifTrue: 
			[encoding := X11Encoding encoding.
			(EUCJPTextConverter encodingNames includes: encoding) 
				ifTrue: [^MacRomanInputInterpreter].
			(UTF8TextConverter encodingNames includes: encoding) 
				ifTrue: [^MacRomanInputInterpreter].
			(ShiftJISTextConverter encodingNames includes: encoding) 
				ifTrue: [^MacRomanInputInterpreter]].
	^MacRomanInputInterpreter