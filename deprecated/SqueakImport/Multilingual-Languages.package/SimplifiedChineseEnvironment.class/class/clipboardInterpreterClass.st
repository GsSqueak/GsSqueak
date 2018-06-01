subclass responsibilities
clipboardInterpreterClass
	| platformName osVersion |
	platformName := Smalltalk platformName.
	osVersion := Smalltalk osVersion.
	(platformName = 'Win32' and: [osVersion = 'CE']) 
		ifTrue: [^NoConversionClipboardInterpreter].
	platformName = 'Win32' ifTrue: [^WinGB2312ClipboardInterpreter].
	platformName = 'Mac OS' 
		ifTrue: 
			[('10*' match: osVersion) 
				ifTrue: [^NoConversionClipboardInterpreter]
				ifFalse: [^WinGB2312ClipboardInterpreter]].
	platformName = 'unix' 
		ifTrue: 
			[(ShiftJISTextConverter encodingNames includes: X11Encoding getEncoding) 
				ifTrue: [^MacShiftJISClipboardInterpreter]
				ifFalse: [^NoConversionClipboardInterpreter]].
	^NoConversionClipboardInterpreter