menu
setXRange

	| range |
	range := UIManager default
		request:
'Type the maximum value for the X axis' translated
		initialAnswer: ((xScale * (self width - handleMorph width) / 2.0) printShowingMaxDecimalPlaces: 2).
	range isEmpty ifFalse: [
		xScale := (2.0 * range asNumber asFloat) / (self width - handleMorph width)].
