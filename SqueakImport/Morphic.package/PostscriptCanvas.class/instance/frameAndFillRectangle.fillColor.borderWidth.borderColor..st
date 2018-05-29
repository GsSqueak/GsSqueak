drawing-rectangles
frameAndFillRectangle: r fillColor: fillColor borderWidth: borderWidth borderColor: borderColor 
	"since postscript strokes on the line and squeak strokes inside, we need 
	to adjust inwards"
	self
		preserveStateDuring: [:pc | pc
				
				rect: (r insetBy: borderWidth / 2);
				 setLinewidth: borderWidth;
				 fill: fillColor andStroke: borderColor]