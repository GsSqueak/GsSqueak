mouse
yellowButtonPressed
	"Answer whether only the yellow mouse button is being pressed. 
	This is the second mouse button or option+click on the Mac."
	^ (self peekButtons bitAnd: 7)
		= 2