inline primitive generated code
lowcodePrimitiveNot64
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_result |
	_gsSqueakTemp_value := self internalPopStackInt64.
	_gsSqueakTemp_result := _gsSqueakTemp_value bitXor: -1.
	self internalPushInt64: _gsSqueakTemp_result