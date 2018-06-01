handle settings
passiveColor: aColor 
	| _gsSqueakTemp_canvas |
	_gsSqueakTemp_canvas := self initializePassiveForm getCanvas.
	_gsSqueakTemp_canvas privatePort fillPattern: aColor;
		 combinationRule: Form rgbMul;
		 fillRect: self passiveForm boundingBox offset: 0 @ 0.
	self
		allSubInstancesDo: [:each | each setDefaultColors; changed]