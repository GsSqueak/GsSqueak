public query
defaultEncodingName
	| platformName osVersion |
	platformName := Smalltalk platformName.
	osVersion := Smalltalk osVersion.
	(platformName = 'Win32' and: [osVersion = 'CE']) ifTrue: [^'utf-8' copy].
	(#('Win32' 'Mac OS' 'ZaurusOS') includes: platformName) 
		ifTrue: [^'gb2312' copy].
	(#('unix') includes: platformName) ifTrue: [^'euc-cn' copy].
	^'mac-roman'