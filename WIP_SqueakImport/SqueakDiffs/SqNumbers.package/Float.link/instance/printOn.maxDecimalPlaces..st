*SqNumbers-printing
printOn: aStream maxDecimalPlaces: placesDesired
	"Refine super implementation in order to avoid any rounding error caused by rounded or roundTo:"
	
	self isFinite ifFalse: [^self printOn: aStream].
	self > 0.0
		ifTrue: [self absPrintExactlyOn: aStream base: 10 decimalPlaces: placesDesired showTrailingFractionalZeros: false]
		ifFalse:
			[self signBit = 1
				ifTrue: [aStream nextPutAll: '-'].
			self = 0.0
				ifTrue: [aStream nextPutAll: '0.0']
				ifFalse: [self absPrintExactlyOn: aStream base: 10 decimalPlaces: placesDesired showTrailingFractionalZeros: false]]
