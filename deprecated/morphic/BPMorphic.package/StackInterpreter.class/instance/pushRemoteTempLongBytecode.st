stack bytecodes
pushRemoteTempLongBytecode
	| _gsSqueakTemp_remoteTempIndex _gsSqueakTemp_tempVectorIndex |
	_gsSqueakTemp_remoteTempIndex := self fetchByte.
	_gsSqueakTemp_tempVectorIndex := self fetchByte.
	self fetchNextBytecode.
	self pushRemoteTemp: _gsSqueakTemp_remoteTempIndex inVectorAt: _gsSqueakTemp_tempVectorIndex