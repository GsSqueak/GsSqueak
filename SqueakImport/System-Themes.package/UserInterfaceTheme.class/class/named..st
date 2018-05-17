initialize-release
named: aString
	^ self allThemes
		detect: [:ea | ea name = aString]
		ifNone: [self new name: aString; register]