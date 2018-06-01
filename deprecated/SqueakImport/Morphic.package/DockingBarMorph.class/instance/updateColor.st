private - layout
updateColor
	"private - update the receiver's color"
	| fill |
	MenuMorph gradientMenu ifFalse: [
		self color ~= originalColor ifTrue: [self color: originalColor].
		^ self].
	""
	fill := GradientFillStyle ramp: self gradientRamp.
	""
	fill origin: self topLeft.
	self isVertical
		ifTrue: [fill direction: self width @ 0]
		ifFalse: [fill direction: 0 @ self height].
	""
	self fillStyle: fill