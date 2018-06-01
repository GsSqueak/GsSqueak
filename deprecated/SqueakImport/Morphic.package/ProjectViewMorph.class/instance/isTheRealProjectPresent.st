drawing
isTheRealProjectPresent

	project ifNil: [^ false].
	project isInMemory ifFalse: [^ false].
	project class == DiskProxy ifTrue: [^ false].
	^true
