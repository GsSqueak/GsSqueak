system control primitives
primitiveMillisecondClockMask
	"Provide access to the millisecond clock mask to support calculation
	of durations based on the millisecond clock value."
	self
		pop: 1
		thenPush: (objectMemory integerObjectOf: MillisecondClockMask)