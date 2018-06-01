inline primitive generated code
lowcodePrimitiveNeg32
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_result |
	_gsSqueakTemp_value := self internalPopStackInt32.
	_gsSqueakTemp_result := _gsSqueakTemp_value negated.
	self internalPushInt32: _gsSqueakTemp_result