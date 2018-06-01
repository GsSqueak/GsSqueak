printing
printOn: aStream showingDecimalPlaces: placesDesired
	"Same as super, except the mantissa knows better how to do it."

	mantissa printOn: aStream showingDecimalPlaces: placesDesired
