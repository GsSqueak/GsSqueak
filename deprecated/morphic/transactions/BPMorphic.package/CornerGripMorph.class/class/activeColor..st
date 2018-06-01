handle settings
activeColor: aColor 
	| _gsSqueakTemp_canvas |
	_gsSqueakTemp_canvas := self initializeActiveForm getCanvas.
	_gsSqueakTemp_canvas privatePort fillPattern: aColor;
		 combinationRule: Form rgbMul;
		 fillRect: self activeForm boundingBox offset: 0 @ 0