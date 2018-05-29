subclass responsibilities
clipboardInterpreterClass
	| platformName osVersion |
	platformName := Smalltalk  platformName.
	osVersion := Smalltalk osVersion.
	(platformName = 'Win32' and: [osVersion = 'CE']) 
		ifTrue: [^NoConversionClipboardInterpreter].
	platformName = 'Win32' ifTrue: [^WinShiftJISClipboardInterpreter].
	platformName = 'Mac OS' ifTrue: [^MacShiftJISClipboardInterpreter].
	^platformName = 'unix' 
		ifTrue: 
			[(ShiftJISTextConverter encodingNames includes: X11Encoding getEncoding) 
				ifTrue: [MacShiftJISClipboardInterpreter]
				ifFalse: [UnixJPClipboardInterpreter]]
		ifFalse: [ NoConversionClipboardInterpreter ]