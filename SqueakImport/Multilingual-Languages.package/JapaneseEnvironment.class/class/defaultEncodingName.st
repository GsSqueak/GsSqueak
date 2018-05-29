public query
defaultEncodingName
	| platformName osVersion |
	platformName := Smalltalk platformName.
	osVersion := Smalltalk osVersion.
	(platformName = 'Win32' and: [osVersion = 'CE']) ifTrue: [^'utf-8'].
	(#('Win32' 'ZaurusOS') includes: platformName) ifTrue: [^'shift-jis'].
	platformName = 'Mac OS' 
		ifTrue: 
			[^('10*' match: osVersion) 
				ifTrue: ['utf-8']
				ifFalse: ['shift-jis']].
	^'unix' = platformName ifTrue: ['euc-jp'] ifFalse: ['mac-roman']