stack bytecodes
pushRemoteTemp: index inVectorAt: tempVectorIndex
	| tempVector |
	tempVector := self temporary: tempVectorIndex.
	self internalPush: (objectMemory fetchPointer: index ofObject: tempVector)