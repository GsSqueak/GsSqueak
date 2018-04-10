drawing
line: pt1 to: pt2 brushForm: brush 
	| _gsSqueakTemp_offset |
	_gsSqueakTemp_offset := origin.
	self setPaintColor: Color black.
	port sourceForm: brush;
		 fillColor: nil;
		 sourceRect: brush boundingBox;
		
		colorMap: (brush colormapIfNeededFor: form);
		 drawFrom: pt1 + _gsSqueakTemp_offset to: pt2 + _gsSqueakTemp_offset