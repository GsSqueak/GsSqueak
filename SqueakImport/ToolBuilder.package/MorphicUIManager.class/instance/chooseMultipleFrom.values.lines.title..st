ui requests
chooseMultipleFrom: labelList values: valueList lines: linesArray title: aString
	"Choose one or more items from the given list. Answer the selected items."

	^ (ListMultipleChooser
		chooseFrom: labelList
		title: aString) ifNotNil: [:indexList |
			indexList collect: [:index | valueList at: index]]