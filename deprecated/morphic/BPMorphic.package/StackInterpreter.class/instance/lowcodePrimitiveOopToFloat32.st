inline primitive generated code
lowcodePrimitiveOopToFloat32
	"Lowcode instruction generator"
	| _gsSqueakTemp_object _gsSqueakTemp_value |
	_gsSqueakTemp_object := self internalPopStack.
	_gsSqueakTemp_value := objectMemory floatValueOf: _gsSqueakTemp_object.
	self internalPushFloat32: _gsSqueakTemp_value