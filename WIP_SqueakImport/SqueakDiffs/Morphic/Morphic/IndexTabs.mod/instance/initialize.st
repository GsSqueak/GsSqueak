initialization
initialize
	"Initialize the receiver. Make sure it is not open to drag and  
	drop"
	super initialize.
	""
	padding := 10.
	verticalPadding := 4.
	basicHeight := 14.
	basicWidth := 200.
	
	self enableDragNDrop: false