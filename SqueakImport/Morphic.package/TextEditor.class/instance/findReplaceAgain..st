typing/selecting keys
findReplaceAgain: aKeyboardEvent 

	self
		insertAndCloseTypeIn;
		findReplaceAgain.

	^ true