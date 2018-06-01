mouse
blueButtonPressed
	"Answer whether only the blue mouse button is being pressed. 
	This is the third mouse button or cmd+click on the Mac."

	^ (self peekButtons bitAnd: 7) = 1
