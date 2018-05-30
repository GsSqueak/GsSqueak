handle settings
activeColor: aColor
	|canvas|
	canvas := self initializeActiveForm getCanvas.
	canvas 
		privatePort fillPattern: aColor;
		combinationRule: Form rgbMul;
		fillRect: (self activeForm boundingBox) offset: 0@0.

		