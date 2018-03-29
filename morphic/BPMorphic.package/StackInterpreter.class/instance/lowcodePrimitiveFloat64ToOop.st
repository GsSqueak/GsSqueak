inline primitive generated code
lowcodePrimitiveFloat64ToOop
	"Lowcode instruction generator"
	| _gsSqueakTemp_floatValue _gsSqueakTemp_object |
	_gsSqueakTemp_floatValue := self internalPopStackFloat64.
	_gsSqueakTemp_object := objectMemory floatObjectOf: _gsSqueakTemp_floatValue.
	self internalPush: _gsSqueakTemp_object