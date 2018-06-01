initialization
initialize
	super initialize.
	self setDefaultParameters.
	self value: (ValueHolder new contents: 0.0).
	lastValue := 0.0