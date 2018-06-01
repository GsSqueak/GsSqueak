menu
erasePixelsOfColor: aColor 
	"Let the user specifiy a color such that all pixels of that color should be erased; then do the erasure"
	| newBounds |
	originalForm
		mapColor: aColor
		to: Color transparent.
	newBounds := originalForm rectangleEnclosingPixelsNotOfColor: Color transparent.
	self form: (originalForm copy: newBounds)