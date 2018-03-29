inline primitive generated code
lowcodePrimitiveFloat64Neg
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_result |
	_gsSqueakTemp_value := self internalPopStackFloat64.
	_gsSqueakTemp_result := _gsSqueakTemp_value negated.
	self internalPushFloat64: _gsSqueakTemp_result