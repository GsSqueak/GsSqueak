control primitives
primitivePerformWithArgs

	| lookupClass rcvr |
	rcvr := self stackValue: argumentCount.
	lookupClass := objectMemory fetchClassOf: rcvr.
	self primitivePerformAt: lookupClass.
