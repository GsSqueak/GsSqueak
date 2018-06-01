accessing
bottomRightColor
	^width = 1 
		ifTrue: [color twiceDarker]
		ifFalse: [color darker]