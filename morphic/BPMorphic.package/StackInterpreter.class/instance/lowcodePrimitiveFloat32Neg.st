inline primitive generated code
lowcodePrimitiveFloat32Neg
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_result |
	_gsSqueakTemp_value := self internalPopStackFloat32.
	_gsSqueakTemp_result := _gsSqueakTemp_value negated.
	self internalPushFloat32: _gsSqueakTemp_result