accessing
currentParent: anObject

	anObject = currentParent ifTrue: [^ self].
	currentParent := anObject.
	self changed: #currentParent.
