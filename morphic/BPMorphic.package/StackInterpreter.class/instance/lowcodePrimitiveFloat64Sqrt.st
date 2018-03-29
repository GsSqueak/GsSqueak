inline primitive generated code
lowcodePrimitiveFloat64Sqrt
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_result |
	_gsSqueakTemp_value := self internalPopStackFloat64.
	_gsSqueakTemp_result := self sqrt: _gsSqueakTemp_value.
	self internalPushFloat64: _gsSqueakTemp_result