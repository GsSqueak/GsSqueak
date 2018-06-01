accessing
searchText: aString
	searchText := aString.
	listMorph filterList: aString asString.
	
	self changed: #searchText.
	self changed: #canAcceptOrAdd.
	self changed: #acceptLabel.
	self changed: #buttons.