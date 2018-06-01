menu building
menuLinesArray: aDirectory
"Answer a menu lines object corresponding to aDirectory"

	| typeCount nameCnt dirDepth|
	typeCount := canTypeFileName 
		ifTrue: [1] 
		ifFalse: [0].
	nameCnt := aDirectory directoryNames size.
	dirDepth := aDirectory pathParts size.
	^Array streamContents: [:s |
		canTypeFileName ifTrue: [s nextPut: 1].
		s nextPut: dirDepth + typeCount + 1.
		s nextPut: dirDepth + nameCnt + typeCount + 1]