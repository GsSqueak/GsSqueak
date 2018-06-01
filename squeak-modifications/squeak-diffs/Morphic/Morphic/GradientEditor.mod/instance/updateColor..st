change reporting
updateColor: aColor
	selectedSketch rotatedForm  floodFill: aColor at: selectedSketch rotatedForm center.
	self updateColorRamp
