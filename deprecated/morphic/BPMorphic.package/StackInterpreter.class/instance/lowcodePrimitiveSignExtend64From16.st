inline primitive generated code
lowcodePrimitiveSignExtend64From16
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_result |
	_gsSqueakTemp_value := self internalPopStackInt64.
	_gsSqueakTemp_result := self cCoerce: _gsSqueakTemp_value to: 'int16_t'.
	self internalPushInt64: _gsSqueakTemp_result