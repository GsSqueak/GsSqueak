drawing-rectangles
frameRoundRect: aRectangle radius: radius width: borderWidth color: borderColor
	"Frame a rounded rectangle with the given attributes."
	| innerRect |
	(borderWidth isZero or:[borderColor isTransparent])
		ifTrue:[^self].
	radius asPoint <= (0@0) 
		ifTrue:[^self frameRectangle: aRectangle width: borderWidth color: borderColor].
	"decompose inner rectangle into bezier shape"
	innerRect := aRectangle insetBy: borderWidth.
	innerRect area <= 0 
		ifTrue:[^self fillRoundRect: aRectangle radius: radius fillStyle: borderColor].
	self setFillColor: borderColor.
	port 
		frameRoundRect: (aRectangle translateBy: origin) truncated 
		radius: radius truncated 
		borderWidth: borderWidth truncated.
