inline primitive generated code
lowcodePrimitiveLeftShift64
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_shiftAmount _gsSqueakTemp_result |
	_gsSqueakTemp_shiftAmount := self internalPopStackInt64.
	_gsSqueakTemp_value := self internalPopStackInt64.
	_gsSqueakTemp_result := _gsSqueakTemp_value << _gsSqueakTemp_shiftAmount.
	self internalPushInt64: _gsSqueakTemp_result