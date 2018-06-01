ui requests
chooseFromOrAddTo: aList lines: linesArray title: aString

	^ ListChooser
		chooseItemFrom: aList
		title: aString
		addAllowed: true