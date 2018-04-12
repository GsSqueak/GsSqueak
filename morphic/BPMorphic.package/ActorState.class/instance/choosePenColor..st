pen
choosePenColor: evt 
	owningPlayer costume
		changeColorTarget: owningPlayer costume
		selector: #penColor:
		originalColor: owningPlayer getPenColor
		hand: evt hand