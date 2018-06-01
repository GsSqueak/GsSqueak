accessing
currentSelection: anObject

	anObject = currentSelection ifTrue: [^ self].
	currentSelection := anObject.
	self changed: #currentSelection.
	self changed: #previewText.
	self changed: #filename.
	self changed: #copyright.