printing
printTruncatedOn: aStream showingDecimalPlaces: placesDesired
	"Print a representation of the receiver on aStream in decimal notation with prescribed number of places after decimal separator.
	Print as if the receiver was truncated to requested precision."

	self printOn: aStream.
	placesDesired > 0
		ifTrue:
			[aStream nextPut: $..
			aStream next: placesDesired put: $0]