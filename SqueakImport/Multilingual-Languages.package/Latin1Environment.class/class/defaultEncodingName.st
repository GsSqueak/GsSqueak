subclass responsibilities
defaultEncodingName
	| platformName osVersion |
	platformName := Smalltalk platformName.
	osVersion := Smalltalk osVersion.
	(platformName = 'Win32' and: [osVersion = 'CE']) ifTrue: [^'utf-8' copy].
	(#('Win32' 'Mac OS' 'ZaurusOS') includes: platformName) 
		ifTrue: [^'iso8859-1' copy].
	(#('unix') includes: platformName) ifTrue: [^'iso8859-1' copy].
	^'mac-roman'