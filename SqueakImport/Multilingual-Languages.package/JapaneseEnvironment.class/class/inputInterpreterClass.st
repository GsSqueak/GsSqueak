subclass responsibilities
inputInterpreterClass
	| platformName osVersion encoding |
	platformName := Smalltalk platformName.
	osVersion := Smalltalk osVersion.
	(platformName = 'Win32'
			and: [osVersion = 'CE'])
		ifTrue: [^ MacRomanInputInterpreter].
	platformName = 'Win32'
		ifTrue: [^ (self win32VMUsesUnicode) ifTrue: [UTF32JPInputInterpreter] ifFalse: [WinShiftJISInputInterpreter]].
	platformName = 'Mac OS'
		ifTrue: [^ (('10*' match: osVersion)
					and: [(Smalltalk getSystemAttribute: 3) isNil])
				ifTrue: [MacUnicodeInputInterpreter]
				ifFalse: [MacShiftJISInputInterpreter]].
	platformName = 'unix'
		ifTrue: [encoding := X11Encoding encoding.
			(EUCJPTextConverter encodingNames includes: encoding)
				ifTrue: [^ UnixEUCJPInputInterpreter].
			(UTF8TextConverter encodingNames includes: encoding)
				ifTrue: [^ UnixUTF8JPInputInterpreter].
			(ShiftJISTextConverter encodingNames includes: encoding)
				ifTrue: [^ MacShiftJISInputInterpreter]].
	^ MacRomanInputInterpreter