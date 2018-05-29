instance creation
addSetFromTTFile: fileName encodingTag: encodingTag ranges: ranges

	| tt |
	(fileName asLowercase endsWith: 'ttf') ifTrue: [
		tt := TTCFontReader readTTFFrom: (FileStream readOnlyFileNamed: fileName).
	] ifFalse: [
		tt := TTCFontReader readFrom: (FileStream readOnlyFileNamed: fileName).
	].

	(tt at: encodingTag + 1) compactForRanges: ranges.
	^ self addToDescription: tt.
