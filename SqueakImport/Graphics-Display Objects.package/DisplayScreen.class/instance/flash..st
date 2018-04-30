displaying
flash: aRectangle 
	"Flash the area of the screen defined by the given rectangle."

	self reverse: aRectangle.
	self forceDisplayUpdate.
	(Delay forMilliseconds: 50) wait.
	self reverse: aRectangle.
	self forceDisplayUpdate.
