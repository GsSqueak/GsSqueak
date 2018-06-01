initialization
initializeBytecodeTableForSqueakV3PlusClosuresNewspeakV4Hybrid
	"StackInterpreter
	initializeBytecodeTableForSqueakV3PlusClosuresNewspeakV4Hybrid "
	| _gsSqueakTemp_v3Table _gsSqueakTemp_v4Table |
	self initializeBytecodeTableForNewspeakV4.
	_gsSqueakTemp_v4Table := BytecodeTable.
	AltBytecodeEncoderClassName := BytecodeEncoderClassName.
	AltLongStoreBytecode := LongStoreBytecode.
	self initializeBytecodeTableForSqueakV3PlusClosures.
	BytecodeSetHasExtensions := true.
	_gsSqueakTemp_v3Table := BytecodeTable.
	BytecodeTable := _gsSqueakTemp_v3Table , _gsSqueakTemp_v4Table