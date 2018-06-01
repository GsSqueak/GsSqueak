ui requests
chooseMultipleFrom: aList lines: linesArray title: aString
	"Choose one or more items from the given list. Answer the indices of the selected items."
	
	^ ListMultipleChooser
		chooseFrom: aList
		title: aString