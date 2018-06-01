accessing
numTemps
	^ (self header bitShift: -18)
		bitAnd: 63