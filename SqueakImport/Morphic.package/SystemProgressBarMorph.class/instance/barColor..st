accessing
barColor: aColor

	| cc fill |
	cc := aColor.

	MenuMorph gradientMenu
		ifFalse: [fill := SolidFillStyle color: cc]
		ifTrue: [
			fill := GradientFillStyle ramp: { 
				0.0 -> cc twiceLighter. 
				1 -> cc twiceDarker }].

	barColor := fill.
	self changed.