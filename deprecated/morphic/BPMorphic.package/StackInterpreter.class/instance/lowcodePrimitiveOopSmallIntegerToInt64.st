inline primitive generated code
lowcodePrimitiveOopSmallIntegerToInt64
	"Lowcode instruction generator"
	| _gsSqueakTemp_object _gsSqueakTemp_value |
	_gsSqueakTemp_object := self internalPopStack.
	_gsSqueakTemp_value := objectMemory integerValueOf: _gsSqueakTemp_object.
	self internalPushInt64: _gsSqueakTemp_value