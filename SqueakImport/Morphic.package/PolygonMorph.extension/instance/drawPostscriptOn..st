*Morphic-MorphicExtras-*morphic-Postscript Canvases
drawPostscriptOn: aCanvas 
	"Display the receiver, a spline curve, approximated by straight 
	line segments."
	| array |
	vertices size < 1
		ifTrue: [self error: 'a polygon must have at least one point'].
	array := self drawArrowsOn: aCanvas.
	closed
		ifTrue: [aCanvas
				drawPolygon: self getVertices
				color: self color
				borderWidth: self borderWidth
				borderColor: self borderColor]
		ifFalse: [self drawClippedBorderOn: aCanvas usingEnds: array].
