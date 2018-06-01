inline primitive generated code
lowcodePrimitiveInt64ToFloat32
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_result |
	_gsSqueakTemp_value := self internalPopStackInt64.
	_gsSqueakTemp_result := self cCoerce: _gsSqueakTemp_value to: 'float'.
	self internalPushFloat64: _gsSqueakTemp_result