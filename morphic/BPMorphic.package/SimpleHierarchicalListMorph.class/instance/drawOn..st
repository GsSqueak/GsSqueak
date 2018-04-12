drawing
drawOn: aCanvas 
	super drawOn: aCanvas.
	self drawHoverOn: aCanvas.
	self drawSelectionOn: aCanvas.
	self drawLinesOn: aCanvas