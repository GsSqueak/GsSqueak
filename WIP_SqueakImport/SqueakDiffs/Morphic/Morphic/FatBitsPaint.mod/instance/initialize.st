initialization
initialize
	"initialize the state of the receiver"
	super initialize.
	""
	self setCurrentToolTo: self toolsForPaintBrush.
	formToEdit := Form extent: 50 @ 40 depth: 8.
	formToEdit fill: formToEdit boundingBox fillColor: Color veryVeryLightGray.
	brushSize := magnification := 4.
	
	brushColor := Color red.
	backgroundColor := Color white.
	self revert