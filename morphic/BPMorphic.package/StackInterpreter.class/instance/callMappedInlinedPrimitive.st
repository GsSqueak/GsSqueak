sista bytecodes
callMappedInlinedPrimitive
	"SistaV1:	236		11101100	iiiiiiii		callMappedInlinedPrimitive"
	| _gsSqueakTemp_primIndex |
	SistaVM
		ifTrue: [_gsSqueakTemp_primIndex := self fetchByte.
			self fetchNextBytecode.
			self sistaMappedInlinePrimitive: _gsSqueakTemp_primIndex]
		ifFalse: [localIP := localIP - 2.
			self respondToUnknownBytecode]