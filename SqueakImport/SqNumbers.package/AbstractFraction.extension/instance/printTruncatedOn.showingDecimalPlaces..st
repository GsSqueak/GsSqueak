*SqNumbers-printing
printTruncatedOn: aStream showingDecimalPlaces: placesDesired
	"Print a representation of the receiver on aStream in decimal notation with prescribed number of places after decimal separator.
	Print as if the receiver was truncated to requested precision."
	
	| truncatedFractionPart integerPart scaling |
	placesDesired <= 0
		ifTrue: [self truncated printOn: aStream]
		ifFalse:
			[scaling := 10 raisedToInteger: placesDesired.
			integerPart := numerator abs quo: denominator.
			truncatedFractionPart := (numerator abs - (integerPart * denominator)) * scaling quo: denominator.
			numerator negative ifTrue: [aStream nextPut: $-].
			integerPart printOn: aStream.
			aStream nextPut: $..
			truncatedFractionPart printOn: aStream base: 10 length: placesDesired padded: true].
