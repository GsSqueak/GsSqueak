stack bytecodes
pushReceiverVariable: fieldIndex

	self internalPush:
		(objectMemory fetchPointer: fieldIndex ofObject: receiver).