drawing-rectangles
frameAndFillRectangle: r fillColor: fillColor borderWidth: borderWidth topLeftColor: topLeftColor bottomRightColor: bottomRightColor 
	self
		preserveStateDuring: [:pc | 
			target newpath.
			pc setLinewidth: 0.
			pc outlinePolygon: {r origin. r topRight. r topRight + (borderWidth negated @ borderWidth). r origin + (borderWidth @ borderWidth). r bottomLeft + (borderWidth @ borderWidth negated). r bottomLeft. r origin};
				 fill: topLeftColor andStroke: topLeftColor.
			target newpath.
			pc outlinePolygon: {r topRight. r bottomRight. r bottomLeft. r bottomLeft + (borderWidth @ borderWidth negated). r bottomRight - (borderWidth @ borderWidth). r topRight + (borderWidth negated @ borderWidth). r topRight};
				 fill: bottomRightColor andStroke: bottomRightColor]