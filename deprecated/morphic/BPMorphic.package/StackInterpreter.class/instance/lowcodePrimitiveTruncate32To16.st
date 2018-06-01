inline primitive generated code
lowcodePrimitiveTruncate32To16
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_result |
	_gsSqueakTemp_value := self internalPopStackInt32.
	_gsSqueakTemp_result := _gsSqueakTemp_value bitAnd: 65535.
	self internalPushInt32: _gsSqueakTemp_result