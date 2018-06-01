accessing
bottomRightColor
	^width = 1 
		ifTrue: [color twiceLighter]
		ifFalse: [color lighter]