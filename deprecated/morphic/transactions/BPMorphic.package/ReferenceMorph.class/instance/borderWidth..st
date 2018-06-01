accessing
borderWidth: aWidth 
	"Set the receiver's border width as indicated, and trigger a fresh layout"
	super borderWidth: aWidth.
	self layoutChanged