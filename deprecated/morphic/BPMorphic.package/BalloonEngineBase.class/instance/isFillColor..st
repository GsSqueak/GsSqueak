testing
isFillColor: fill 
	^ ((self makeUnsignedFrom: fill)
		bitAnd: 4278190080)
		~= 0