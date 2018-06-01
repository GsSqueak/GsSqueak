accessing - columns
preferredWidthOfColumn: index

	^ (self fontToUse widthOfString: (self contentsAtColumn: index)) + 
		(index = 1 ifTrue: [self toggleRectangle right - self left] ifFalse: [0])