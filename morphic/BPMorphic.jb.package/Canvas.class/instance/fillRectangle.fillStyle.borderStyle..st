drawing-rectangles
fillRectangle: aRectangle fillStyle: aFillStyle borderStyle: aBorderStyle 
	"Fill the given rectangle."
	aFillStyle isTransparent
		ifFalse: [self
				fillRectangle: (aRectangle insetBy: aBorderStyle inset)
				fillStyle: aFillStyle].
	aBorderStyle
		ifNil: [^ self].
	aBorderStyle width <= 0
		ifTrue: [^ self].
	aBorderStyle frameRectangle: aRectangle on: self