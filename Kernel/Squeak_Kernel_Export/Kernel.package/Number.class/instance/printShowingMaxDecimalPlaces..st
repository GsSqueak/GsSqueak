printing
printShowingMaxDecimalPlaces: placesDesired
	"Print the receiver showing at most the given number of places desired after the decimal point.
	Trailing zeros of decimal part are discarded, so the number of digits after the decimal point may vary.
	When placesDesired is zero or negative, or when fraction part vanish, no decimal point is shown."

	^String new: placesDesired + 10 streamContents: [:aStream |
		self printOn: aStream maxDecimalPlaces: placesDesired]