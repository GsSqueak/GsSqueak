control primitives
primitiveDoPrimitiveWithArgs
	| argumentArray arraySize index cntxSize primIdx |
	argumentArray := self stackTop.
	arraySize := objectMemory fetchWordLengthOf: argumentArray.
	cntxSize := objectMemory fetchWordLengthOf: activeContext.
	self success: self stackPointerIndex + arraySize < cntxSize.
	(objectMemory isArray: argumentArray) ifFalse: [^ self primitiveFail].

	primIdx := self stackIntegerValue: 1.
	self successful ifFalse: [^ self primitiveFail]. "invalid args"

	"Pop primIndex and argArray, then push args in place..."
	self pop: 2.
	primitiveIndex := primIdx.
	argumentCount := arraySize.
	index := 1.
	[index <= argumentCount]
		whileTrue: [self push: (objectMemory fetchPointer: index - 1 ofObject: argumentArray).
			index := index + 1].

	"Run the primitive (sets primFailCode)"
	objectMemory pushRemappableOop: argumentArray. "prim might alloc/gc"
	lkupClass := objectMemory getNilObj.
	self primitiveResponse.
	argumentArray := objectMemory popRemappableOop.
	self successful
		ifFalse: ["If primitive failed, then restore state for failure code"
			self pop: arraySize.
			self pushInteger: primIdx.
			self push: argumentArray.
			argumentCount := 2]