arithmetic float primitives
primitiveSmallFloatExponent
	"Answer the exponent part of this float."
	self
		stackTopPut: (objectMemory integerObjectOf: (objectMemory exponentOfSmallFloat: self stackTop)
					- 1)