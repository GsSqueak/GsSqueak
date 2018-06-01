boxes
genericBoxArea: countDownFromTop

	^self innerBounds right @ (self top + (countDownFromTop * 2 * borderWidth)) 
		extent: borderWidth @ borderWidth
