drawing
drawOn: aCanvas

	super drawOn: aCanvas.
	self boxesAndColorsAndSelectors do: [ :each |
		aCanvas fillRectangle: each first fillStyle: each second
	].

