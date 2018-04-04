*SqNumbers-mathematical functions
arcTan: denominator
	"Answer the angle in radians, taking care of 4 quadrants.
	Implementation note: use signBit and sign: in order to catch cases of negativeZero"

	self = 0.0
		ifTrue:
			[denominator signBit = 0 ifTrue: [ ^0.0 ].
			^Pi sign: self ].
	denominator = 0.0 ifTrue: [ ^Halfpi sign: self ].
	denominator > 0.0 	ifTrue: [ ^(self / denominator) arcTan ].
	^(self / denominator) arcTan + (Pi sign: self)
