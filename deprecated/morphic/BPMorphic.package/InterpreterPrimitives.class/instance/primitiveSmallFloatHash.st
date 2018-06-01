arithmetic float primitives
primitiveSmallFloatHash
	"Answer the ieee 754 double precision floating point bits of the
	SmallFloat receiver."
	self
		pop: 1
		thenPush: (objectMemory
				positive64BitIntegerFor: (objectMemory smallFloatBitsOf: self stackTop))