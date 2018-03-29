inline primitive generated code
lowcodePrimitiveNeg64
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_result |
	_gsSqueakTemp_value := self internalPopStackInt64.
	_gsSqueakTemp_result := _gsSqueakTemp_value negated.
	self internalPushInt64: _gsSqueakTemp_result