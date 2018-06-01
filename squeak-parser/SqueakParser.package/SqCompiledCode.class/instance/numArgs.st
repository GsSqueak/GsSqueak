accessing
numArgs
	^ (self header bitShift: -24)
		bitAnd: 15