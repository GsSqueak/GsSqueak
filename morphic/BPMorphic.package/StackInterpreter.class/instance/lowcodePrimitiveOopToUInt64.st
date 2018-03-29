inline primitive generated code
lowcodePrimitiveOopToUInt64
	"Lowcode instruction generator"
	| _gsSqueakTemp_object _gsSqueakTemp_value |
	_gsSqueakTemp_object := self internalPopStack.
	_gsSqueakTemp_value := self positive64BitValueOf: _gsSqueakTemp_object.
	self internalPushInt64: _gsSqueakTemp_value