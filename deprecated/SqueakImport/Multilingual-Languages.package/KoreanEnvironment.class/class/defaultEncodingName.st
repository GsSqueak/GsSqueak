as yet unclassified
defaultEncodingName
	| platformName osVersion |
	platformName := Smalltalk platformName.
	osVersion := Smalltalk osVersion.
	(platformName = 'Win32' and: [osVersion = 'CE']) ifTrue: [^'utf-8' copy].
	(#('Win32' 'Mac OS' 'ZaurusOS') includes: platformName) 
		ifTrue: [^'euc-kr' copy].
	(#('unix') includes: platformName) ifTrue: [^'euc-kr' copy].
	^'mac-roman'