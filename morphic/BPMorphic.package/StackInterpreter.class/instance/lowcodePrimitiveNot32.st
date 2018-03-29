inline primitive generated code
lowcodePrimitiveNot32
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_result |
	_gsSqueakTemp_value := self internalPopStackInt32.
	_gsSqueakTemp_result := _gsSqueakTemp_value bitXor: -1.
	self internalPushInt32: _gsSqueakTemp_result