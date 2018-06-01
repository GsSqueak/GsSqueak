ChooserTool compatibility
chooseFrom: aList title: aString
	^ self
		chooseIndexFrom: aList 
		title: aString
		addAllowed: false