handle settings
passiveColor: aColor 
	| canvas |
	canvas := self initializePassiveForm getCanvas.
	canvas privatePort fillPattern: aColor;
		 combinationRule: Form rgbMul;
		 fillRect: self passiveForm boundingBox offset: 0 @ 0.
	self
		allSubInstancesDo: [:each | each setDefaultColors; changed]