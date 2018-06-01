menu
setMaxVal

	| newMaxVal |
	newMaxVal := UIManager default
		request: 'Maximum value?'
		initialAnswer: maxVal printString.
	newMaxVal isEmpty ifFalse: [
		maxVal := newMaxVal asNumber.
		minVal := minVal min: maxVal].
