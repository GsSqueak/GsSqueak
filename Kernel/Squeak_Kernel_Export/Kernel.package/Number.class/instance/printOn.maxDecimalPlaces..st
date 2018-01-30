printing
printOn: aStream maxDecimalPlaces: placesDesired
	"Print a representation of the receiver on aStream in decimal notation with at most prescribed number of places after decimal separator."

	| rounder rounded roundedFractionPart placesRequired shorten |
	placesDesired <= 0 ifTrue: [^ self rounded printOn: aStream].
	rounder := 10 raisedToInteger: placesDesired.
	rounded := self roundTo: rounder reciprocal.
	rounded negative ifTrue: [aStream nextPut: $-].
	rounded := rounded abs.
	rounded integerPart truncated printOn: aStream.
	roundedFractionPart := (rounded fractionPart * rounder) truncated.
	placesRequired := placesDesired.
	[roundedFractionPart = 0 ifTrue: [^self].
	(shorten := roundedFractionPart // 10) * 10 = roundedFractionPart]
		whileTrue:
			[placesRequired := placesRequired - 1.
			roundedFractionPart := shorten].
	placesRequired > 0
		ifTrue:
			[aStream nextPut: $..
			roundedFractionPart printOn: aStream base: 10 length: placesRequired padded: true]