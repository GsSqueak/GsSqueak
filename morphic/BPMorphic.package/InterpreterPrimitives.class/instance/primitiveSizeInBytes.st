memory space primitives
primitiveSizeInBytes
	| _gsSqueakTemp_byteSize |
	_gsSqueakTemp_byteSize := objectMemory totalByteSizeOf: self stackTop.
	self
		pop: argumentCount + 1
		thenPush: (self positive64BitIntegerFor: _gsSqueakTemp_byteSize)