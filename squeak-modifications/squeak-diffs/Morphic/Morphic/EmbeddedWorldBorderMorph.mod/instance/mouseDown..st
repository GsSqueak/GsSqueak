event handling
mouseDown: evt

	self boxesAndColorsAndSelectors do: [ :each |
		(each first containsPoint: evt cursorPoint) ifTrue: [
			^self perform: each third
		].
	].


