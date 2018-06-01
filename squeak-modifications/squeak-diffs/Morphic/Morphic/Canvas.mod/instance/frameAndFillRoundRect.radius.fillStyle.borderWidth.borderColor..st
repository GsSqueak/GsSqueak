drawing-rectangles
frameAndFillRoundRect: aRectangle radius: cornerRadius fillStyle: fillStyle borderWidth: bw borderColor: bc

	self
		frameAndFillRectangle: aRectangle
		fillColor: fillStyle asColor
		borderWidth: bw
		borderColor: bc.