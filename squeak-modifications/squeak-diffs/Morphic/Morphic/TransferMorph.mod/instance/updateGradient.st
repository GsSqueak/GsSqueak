updating
updateGradient

	| cc fill |

	MenuMorph gradientMenu ifFalse: [^ self].

	self fullBounds.
	
	cc := self color.
	fill := GradientFillStyle ramp: {
		0.0 -> Color white.
		0.10 -> (cc mixed: 0.5 with: Color white).
		0.5 -> cc.
		0.8 -> cc twiceDarker}.
	fill
		origin: self topLeft;
		direction: 0@self height.
	self fillStyle: fill.