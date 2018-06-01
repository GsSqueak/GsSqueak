menu
setMinVal

	| newMinVal |
	newMinVal := UIManager default
		request: 'Minimum value?'
		initialAnswer: minVal printString.
	newMinVal isEmpty ifFalse: [
		minVal := newMinVal asNumber.
		maxVal := maxVal max: minVal].
