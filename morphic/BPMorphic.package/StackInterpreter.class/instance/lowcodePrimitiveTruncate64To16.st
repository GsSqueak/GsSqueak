inline primitive generated code
lowcodePrimitiveTruncate64To16
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_result |
	_gsSqueakTemp_value := self internalPopStackInt64.
	_gsSqueakTemp_result := _gsSqueakTemp_value bitAnd: 65535.
	self internalPushInt32: _gsSqueakTemp_result