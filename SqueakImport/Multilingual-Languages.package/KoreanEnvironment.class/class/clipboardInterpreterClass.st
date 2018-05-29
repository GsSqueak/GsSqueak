as yet unclassified
clipboardInterpreterClass
	| platformName osVersion |
	platformName := Smalltalk platformName.
	osVersion := Smalltalk osVersion.
	(platformName = 'Win32' and: [osVersion = 'CE']) 
		ifTrue: [^NoConversionClipboardInterpreter].
	platformName = 'Win32' ifTrue: [^WinKSX1001ClipboardInterpreter].
	platformName = 'Mac OS' 
		ifTrue: 
			[('10*' match: osVersion) 
				ifTrue: [^NoConversionClipboardInterpreter]
				ifFalse: [^WinKSX1001ClipboardInterpreter]].
	platformName = 'unix' 
		ifTrue: 
			[(ShiftJISTextConverter encodingNames includes: X11Encoding getEncoding) 
				ifTrue: [^WinKSX1001ClipboardInterpreter]
				ifFalse: [^NoConversionClipboardInterpreter]].
	^NoConversionClipboardInterpreter