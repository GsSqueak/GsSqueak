inline primitive generated code
lowcodePrimitiveFloat32ToOop
	"Lowcode instruction generator"
	| _gsSqueakTemp_singleFloatValue _gsSqueakTemp_object |
	_gsSqueakTemp_singleFloatValue := self internalPopStackFloat32.
	_gsSqueakTemp_object := objectMemory floatObjectOf: _gsSqueakTemp_singleFloatValue.
	self internalPush: _gsSqueakTemp_object