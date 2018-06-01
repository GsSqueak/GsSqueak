event handling
handlesMouseDown: evt

	self boxesAndColorsAndSelectors do: [ :each |
		(each first containsPoint: evt cursorPoint) ifTrue: [^true]
	].
	^false

