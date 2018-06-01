inline primitive generated code
lowcodePrimitiveInt32ToOop
	"Lowcode instruction generator"
	| _gsSqueakTemp_object _gsSqueakTemp_value |
	_gsSqueakTemp_value := self internalPopStackInt32.
	_gsSqueakTemp_object := objectMemory signed32BitIntegerFor: _gsSqueakTemp_value.
	self internalPush: _gsSqueakTemp_object