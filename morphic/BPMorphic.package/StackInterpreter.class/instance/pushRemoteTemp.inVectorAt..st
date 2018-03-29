stack bytecodes
pushRemoteTemp: index inVectorAt: tempVectorIndex 
	| _gsSqueakTemp_tempVector |
	_gsSqueakTemp_tempVector := self temporary: tempVectorIndex in: localFP.
	self
		internalPush: (objectMemory fetchPointer: index ofObject: _gsSqueakTemp_tempVector)