initialization
initialize
	"Initialize the receiver."

	super initialize.
	"currentBorderColor := Color gray."
	self addProjectNameMorphFiller.
	self enableDragNDrop: true.
	self isOpaque: true.
