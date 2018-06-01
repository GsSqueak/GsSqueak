inline primitive generated code
lowcodePrimitiveOopSmallIntegerToInt32
	"Lowcode instruction generator"
	| _gsSqueakTemp_object _gsSqueakTemp_value |
	_gsSqueakTemp_object := self internalPopStack.
	_gsSqueakTemp_value := objectMemory integerValueOf: _gsSqueakTemp_object.
	self internalPushInt32: _gsSqueakTemp_value