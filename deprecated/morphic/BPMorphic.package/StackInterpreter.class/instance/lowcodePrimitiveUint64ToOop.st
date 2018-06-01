inline primitive generated code
lowcodePrimitiveUint64ToOop
	"Lowcode instruction generator"
	| _gsSqueakTemp_object _gsSqueakTemp_value |
	_gsSqueakTemp_value := self internalPopStackInt64.
	_gsSqueakTemp_object := self positive64BitIntegerFor: _gsSqueakTemp_value.
	self internalPush: _gsSqueakTemp_object