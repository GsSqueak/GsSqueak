drawing
drawOn: aCanvas
	| origin extent offset |
	(font isNil) 
		ifTrue:[^aCanvas frameRectangle: bounds color: Color black].
	origin := self position asIntegerPoint.
	extent := self extent asIntegerPoint.
	0 to: 16 do:[:i|
		offset := (extent x * i // 16) @ (extent y * i // 16).
		aCanvas line: origin x @ (origin y + offset y) 
				to: (origin x + extent x) @ (origin y + offset y)
				width: borderWidth color: borderColor.
		aCanvas line: (origin x + offset x) @ origin y 
				to: (origin x + offset x) @ (origin y + extent y)
				width: borderWidth color: borderColor.
	].
	aCanvas asBalloonCanvas preserveStateDuring:[:balloonCanvas|
		balloonCanvas transformBy: self transform.
		balloonCanvas aaLevel: self smoothing.
		self drawCharactersOn: balloonCanvas.
	].