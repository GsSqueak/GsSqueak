drawing-rectangles
frameRoundRect: aRectangle radius: radius width: borderWidth color: borderColor 
	"Frame a rounded rectangle with the given attributes."
	| _gsSqueakTemp_innerRect |
	(borderWidth isZero
			or: [borderColor isTransparent])
		ifTrue: [^ self].
	radius asPoint <= (0 @ 0)
		ifTrue: [^ self
				frameRectangle: aRectangle
				width: borderWidth
				color: borderColor].
	"decompose inner rectangle into bezier shape"
	_gsSqueakTemp_innerRect := aRectangle insetBy: borderWidth.
	_gsSqueakTemp_innerRect area <= 0
		ifTrue: [^ self
				fillRoundRect: aRectangle
				radius: radius
				fillStyle: borderColor].
	self setFillColor: borderColor.
	port
		frameRoundRect: (aRectangle translateBy: origin) truncated
		radius: radius truncated
		borderWidth: borderWidth truncated