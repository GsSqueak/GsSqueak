inline primitive generated code
lowcodePrimitiveInt32ToFloat64
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_result |
	_gsSqueakTemp_value := self internalPopStackInt32.
	_gsSqueakTemp_result := self cCoerce: _gsSqueakTemp_value to: 'double'.
	self internalPushFloat64: _gsSqueakTemp_result