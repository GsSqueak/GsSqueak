inline primitive generated code
lowcodePrimitiveZeroExtend64From16
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_result |
	_gsSqueakTemp_value := self internalPopStackInt64.
	_gsSqueakTemp_result := self cCoerce: _gsSqueakTemp_value to: 'uint16_t'.
	self internalPushInt64: _gsSqueakTemp_result