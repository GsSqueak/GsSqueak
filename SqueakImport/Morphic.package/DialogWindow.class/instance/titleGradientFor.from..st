initialization
titleGradientFor: morph from: aColor

	| cc gradient |
	cc := aColor.
	gradient := GradientFillStyle ramp: {
		0.0 -> Color white. 
		0.15 ->(cc mixed: 0.5 with: Color white). 
		0.7 -> cc.
	}.
	gradient origin: morph topLeft.
	gradient direction: 0 @ (TextStyle defaultFont height + 10).
	^ gradient