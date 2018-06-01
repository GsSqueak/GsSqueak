event handling
doubleClickTimeout: evt 
	self showBalloon: 'ClickTimeout' hand: evt hand.
	self borderWidth: self borderWidth \\ 11 + 2