menu
setYRange

	| range |
	range := UIManager default
		request:
'Type the maximum value for the Y axis'  translated
		initialAnswer: ((yScale * (self width - handleMorph width) / 2.0) printShowingMaxDecimalPlaces: 2).
	range isEmpty ifFalse: [
		yScale := (2.0 * range asNumber asFloat) / (self width - handleMorph width)].
