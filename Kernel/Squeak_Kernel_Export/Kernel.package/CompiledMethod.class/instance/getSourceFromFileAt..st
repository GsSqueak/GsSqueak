source code management
getSourceFromFileAt: sourcePointer
	
	| position index |
	position := SourceFiles filePositionFromSourcePointer: sourcePointer.
	position = 0 ifTrue: [ ^nil ].
	index := SourceFiles fileIndexFromSourcePointer: sourcePointer.
	^(RemoteString newFileNumber: index position: position)
		text