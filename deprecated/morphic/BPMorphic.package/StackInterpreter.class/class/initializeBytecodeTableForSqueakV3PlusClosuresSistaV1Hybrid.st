initialization
initializeBytecodeTableForSqueakV3PlusClosuresSistaV1Hybrid
	"StackInterpreter
	initializeBytecodeTableForSqueakV3PlusClosuresSistaV1Hybrid "
	| _gsSqueakTemp_v3Table _gsSqueakTemp_v1Table |
	self initializeBytecodeTableForSistaV1.
	_gsSqueakTemp_v1Table := BytecodeTable.
	AltBytecodeEncoderClassName := BytecodeEncoderClassName.
	AltLongStoreBytecode := LongStoreBytecode.
	self initializeBytecodeTableForSqueakV3PlusClosures.
	BytecodeSetHasExtensions := true.
	_gsSqueakTemp_v3Table := BytecodeTable.
	BytecodeTable := _gsSqueakTemp_v3Table , _gsSqueakTemp_v1Table