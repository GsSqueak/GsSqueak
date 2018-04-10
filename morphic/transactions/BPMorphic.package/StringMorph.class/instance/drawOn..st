drawing
drawOn: aCanvas 
	aCanvas
		drawString: contents
		in: bounds
		font: self fontToUse
		color: color