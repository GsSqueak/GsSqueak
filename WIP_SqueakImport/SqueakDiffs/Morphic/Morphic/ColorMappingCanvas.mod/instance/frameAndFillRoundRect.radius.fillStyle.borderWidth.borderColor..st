drawing-rectangles
frameAndFillRoundRect: aRectangle radius: cornerRadius fillStyle: fillStyle borderWidth: bw borderColor: bc
	"Draw the rectangle using the given attributes"
	myCanvas
		frameAndFillRoundRect: aRectangle
		radius: cornerRadius
		fillStyle: (self mapFillStyle: fillStyle)
		borderWidth: bw
		borderColor: (self mapColor: bc)
