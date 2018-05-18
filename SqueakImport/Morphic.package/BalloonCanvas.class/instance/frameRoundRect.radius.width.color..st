drawing-rectangles
frameRoundRect: aRectangle radius: radius width: borderWidth color: borderColor
	| outerPoints innerRect innerRadius innerPoints |
	(borderWidth isZero or:[borderColor isTransparent])
		ifTrue:[^self].
	radius asPoint <= (0@0) 
		ifTrue:[^self frameRectangle: aRectangle width: borderWidth color: borderColor].
	"decompose inner rectangle into bezier shape"
	innerRect := aRectangle insetBy: borderWidth.
	innerRect area <= 0 
		ifTrue:[^self fillRoundRect: aRectangle radius: radius fillStyle: borderColor].
	innerRadius := (radius - borderWidth) asPoint.
	innerPoints := self makeRoundRectShape: innerRect radius: innerRadius.
	"decompose outer rectangle into bezier shape"
	outerPoints := self makeRoundRectShape: aRectangle radius: radius.
	self
		drawGeneralBezierShape: (Array with: outerPoints with: innerPoints)
		color: borderColor
		borderWidth: 0
		borderColor: nil.