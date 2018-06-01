menu
erasePixelsOfColor: aColor 
	"Let the user specifiy a color such that all pixels of that color should be
	erased; then do the erasure"
	| _gsSqueakTemp_newBounds |
	originalForm mapColor: aColor to: Color transparent.
	_gsSqueakTemp_newBounds := originalForm rectangleEnclosingPixelsNotOfColor: Color transparent.
	self
		form: (originalForm copy: _gsSqueakTemp_newBounds)