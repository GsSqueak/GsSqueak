drawing-rectangles
frameRectangle: r width: w color: c 
	^ self
		frameAndFillRectangle: r
		fillColor: Color transparent
		borderWidth: w
		borderColor: c