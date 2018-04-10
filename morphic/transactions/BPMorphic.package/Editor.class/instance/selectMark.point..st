new selection
selectMark: mark point: point 
	"Deselect, then select the specified characters inclusive.
	Be sure the selection is in view."
	(mark = self markIndex
			and: [point + 1 = self pointIndex])
		ifFalse: [self selectInvisiblyMark: mark point: point]