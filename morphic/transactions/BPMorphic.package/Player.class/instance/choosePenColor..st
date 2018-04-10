pen
choosePenColor: evt 
	self costume
		changeColorTarget: self costume
		selector: #penColor:
		originalColor: self getPenColor
		hand: evt hand