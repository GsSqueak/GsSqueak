inline primitive generated code
lowcodePrimitiveSmallInt32ToOop
	"Lowcode instruction generator"
	| _gsSqueakTemp_object _gsSqueakTemp_value |
	_gsSqueakTemp_value := self internalPopStackInt32.
	_gsSqueakTemp_object := objectMemory integerObjectOf: _gsSqueakTemp_value.
	self internalPush: _gsSqueakTemp_object