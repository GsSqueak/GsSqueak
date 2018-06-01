stack bytecodes
storeRemoteTemp: index inVectorAt: tempVectorIndex 
	| _gsSqueakTemp_tempVector |
	_gsSqueakTemp_tempVector := self temporary: tempVectorIndex in: localFP.
	objectMemory
		storePointer: index
		ofObject: _gsSqueakTemp_tempVector
		withValue: self internalStackTop