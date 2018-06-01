typing/selecting keys
findAgain: aKeyboardEvent 
	"Find the desired text again."

	self
		insertAndCloseTypeIn;
		findAgain.
	
	^ true