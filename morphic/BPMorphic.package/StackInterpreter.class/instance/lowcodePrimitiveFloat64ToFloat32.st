inline primitive generated code
lowcodePrimitiveFloat64ToFloat32
	"Lowcode instruction generator"
	| _gsSqueakTemp_floatValue _gsSqueakTemp_singleFloatResult |
	_gsSqueakTemp_floatValue := self internalPopStackFloat64.
	_gsSqueakTemp_singleFloatResult := self cCoerce: _gsSqueakTemp_floatValue to: 'float'.
	self internalPushFloat32: _gsSqueakTemp_singleFloatResult