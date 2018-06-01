accessing - columns
widthOfColumn: columnIndex 

	^ (container widthOfColumn: columnIndex) ifNil: [self width]