inline primitive generated code
lowcodePrimitiveLeftShift32
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_shiftAmount _gsSqueakTemp_result |
	_gsSqueakTemp_shiftAmount := self internalPopStackInt32.
	_gsSqueakTemp_value := self internalPopStackInt32.
	_gsSqueakTemp_result := _gsSqueakTemp_value << _gsSqueakTemp_shiftAmount.
	self internalPushInt32: _gsSqueakTemp_result