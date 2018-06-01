accessing
contentsOfArea: aRectangle into: aForm 
	| _gsSqueakTemp_bb |
	self flush.
	_gsSqueakTemp_bb := BitBlt toForm: aForm.
	_gsSqueakTemp_bb sourceForm: form;
		 combinationRule: Form over;
		 sourceX: aRectangle left + origin x;
		 sourceY: aRectangle top + origin y;
		 width: aRectangle width;
		 height: aRectangle height;
		 copyBits.
	^ aForm