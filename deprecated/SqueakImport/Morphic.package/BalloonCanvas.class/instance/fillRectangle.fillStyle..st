drawing-rectangles
fillRectangle: aRectangle fillStyle: aFillStyle
	"Fill the given rectangle."
	^self drawRectangle: aRectangle
			color: aFillStyle "@@: Name confusion!!!"
			borderWidth: 0
			borderColor: nil
