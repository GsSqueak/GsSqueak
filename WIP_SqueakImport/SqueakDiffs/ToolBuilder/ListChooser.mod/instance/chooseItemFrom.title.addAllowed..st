initialize-release
chooseItemFrom: labelList title: aString addAllowed: aBoolean

	self items: labelList asOrderedCollection.
	self title: aString.
	self addAllowed: aBoolean.

	ToolBuilder open: self.
	^ self result