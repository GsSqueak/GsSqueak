inline primitive generated code
lowcodePrimitiveZeroExtend64From32
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_result |
	_gsSqueakTemp_value := self internalPopStackInt32.
	_gsSqueakTemp_result := self cCoerce: _gsSqueakTemp_value to: 'uint32_t'.
	self internalPushInt64: _gsSqueakTemp_result