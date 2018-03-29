inline primitive generated code
lowcodePrimitiveFloat32ToFloat64
	"Lowcode instruction generator"
	| _gsSqueakTemp_singleFloatValue _gsSqueakTemp_doubleResult |
	_gsSqueakTemp_singleFloatValue := self internalPopStackFloat32.
	_gsSqueakTemp_doubleResult := self cCoerce: _gsSqueakTemp_singleFloatValue to: 'double'.
	self internalPushFloat64: _gsSqueakTemp_doubleResult