drawing
drawOn: aCanvas

	| area fill |
	super drawOn: aCanvas.
	
	self barSize > 0 ifTrue: [
		area := self innerBounds.
		area := area origin extent: (self barSize min: area extent x)@area extent y.

		fill := self barColor isColor
			ifTrue: [SolidFillStyle color: self barColor]
			ifFalse: [self barColor].
		fill isGradientFill ifTrue: [
			fill origin: area origin.
			fill direction: 0@ area height].

		aCanvas
			fillRectangle: area
			fillStyle: fill
			borderStyle: (SimpleBorder new width: 1; color: fill asColor muchDarker).
	].
