misc
grabPlayerIn(Smalltalk at: #'ActiveWorld')
	"Invoked from a Viewer: rip my morph out of its container, wherever
	that may be, and place it in the hand, being careful to set things up
	so that if the subsequent drop is rejected, the morph will end up in a
	visible location on the screen"
	self grabPlayerIn: (Smalltalk at: #'ActiveWorld')