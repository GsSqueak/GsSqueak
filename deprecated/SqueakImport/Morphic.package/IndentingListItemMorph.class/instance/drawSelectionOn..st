drawing
drawSelectionOn: aCanvas 

	| fill |
	fill := self selectionColor isColor
		ifTrue: [SolidFillStyle color: self selectionColor]
		ifFalse: [self selectionColor].
	fill isGradientFill ifTrue: [
		fill origin: self topLeft.
		fill direction: 0@ self height].

	aCanvas
		fillRectangle: self bounds
		fillStyle: fill.