inline primitive generated code
lowcodePrimitiveFloat32Sqrt
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_result |
	_gsSqueakTemp_value := self internalPopStackFloat32.
	_gsSqueakTemp_result := self sqrt: _gsSqueakTemp_value.
	self internalPushFloat32: _gsSqueakTemp_result