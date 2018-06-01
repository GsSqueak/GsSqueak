subclass responsibilities
defaultEncodingName
	| platformName osVersion |
	platformName := Smalltalk platformName.
	osVersion := Smalltalk osVersion.
	(platformName = 'Win32' and: [osVersion = 'CE']) ifTrue: [^'utf-8' copy].
	(#('Win32') includes: platformName) 
		ifTrue: [^'cp-1250' copy].
	(#('unix') includes: platformName) ifTrue: [^'iso8859-2' copy].
	^'mac-roman'