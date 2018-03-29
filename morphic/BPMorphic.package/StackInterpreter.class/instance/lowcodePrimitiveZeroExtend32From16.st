inline primitive generated code
lowcodePrimitiveZeroExtend32From16
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_result |
	_gsSqueakTemp_value := self internalPopStackInt32.
	_gsSqueakTemp_result := self cCoerce: _gsSqueakTemp_value to: 'uint16_t'.
	self internalPushInt32: _gsSqueakTemp_result