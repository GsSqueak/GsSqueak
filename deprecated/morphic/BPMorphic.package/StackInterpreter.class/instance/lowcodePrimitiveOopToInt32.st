inline primitive generated code
lowcodePrimitiveOopToInt32
	"Lowcode instruction generator"
	| _gsSqueakTemp_object _gsSqueakTemp_value |
	_gsSqueakTemp_object := self internalPopStack.
	_gsSqueakTemp_value := self signed32BitValueOf: _gsSqueakTemp_object.
	self internalPushInt32: _gsSqueakTemp_value