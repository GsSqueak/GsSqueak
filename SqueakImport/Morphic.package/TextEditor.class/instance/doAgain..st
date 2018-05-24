typing/selecting keys
doAgain: aKeyboardEvent 
	"Do the previous thing again once. 1/26/96 sw"

	self insertAndCloseTypeIn.
	self again.
	^ true