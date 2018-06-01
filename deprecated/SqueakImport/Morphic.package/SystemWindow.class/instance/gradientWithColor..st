colors
gradientWithColor: aColor

	| gradient cc |
	cc := aColor adjustSaturation: -0.08 brightness: 0.4.
	gradient := GradientFillStyle ramp: {
		0.0 -> (self isKeyWindow ifTrue: [cc muchLighter] ifFalse: [cc]). 
		0.25 -> (aColor mixed: 0.5 with: cc). 
		1.0 -> aColor.
	}.
	gradient origin: self topLeft.
	gradient direction: 0 @ self labelHeight.
	^gradient