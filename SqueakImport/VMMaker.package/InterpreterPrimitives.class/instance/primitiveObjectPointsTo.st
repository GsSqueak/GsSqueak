object access primitives
primitiveObjectPointsTo
	| rcvr thang lastField |
	thang := self popStack.
	rcvr := self popStack.
	(objectMemory isIntegerObject: rcvr) ifTrue: [^self pushBool: false].

	lastField := objectMemory lastPointerOf: rcvr.
	objectMemory baseHeaderSize to: lastField by: objectMemory bytesPerWord do:
		[:i | (objectMemory longAt: rcvr + i) = thang
			ifTrue: [^ self pushBool: true]].
	self pushBool: false.