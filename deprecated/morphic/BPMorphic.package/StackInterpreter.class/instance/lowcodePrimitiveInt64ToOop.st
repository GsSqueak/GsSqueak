inline primitive generated code
lowcodePrimitiveInt64ToOop
	"Lowcode instruction generator"
	| _gsSqueakTemp_object _gsSqueakTemp_value |
	_gsSqueakTemp_value := self internalPopStackInt64.
	_gsSqueakTemp_object := objectMemory signed64BitIntegerFor: _gsSqueakTemp_value.
	self internalPush: _gsSqueakTemp_object