accessing
topLeftColor
	^width = 1 
		ifTrue: [color twiceDarker]
		ifFalse: [color darker]