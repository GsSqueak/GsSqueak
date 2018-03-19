menus
changePixelsOfColor: c toColor: newColor 
	| _gsSqueakTemp_r |
	originalForm mapColor: c to: newColor.
	_gsSqueakTemp_r := originalForm rectangleEnclosingPixelsNotOfColor: Color transparent.
	self
		form: (originalForm copy: _gsSqueakTemp_r)