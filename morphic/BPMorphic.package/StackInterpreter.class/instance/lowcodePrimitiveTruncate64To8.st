inline primitive generated code
lowcodePrimitiveTruncate64To8
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_result |
	_gsSqueakTemp_value := self internalPopStackInt64.
	_gsSqueakTemp_result := _gsSqueakTemp_value bitAnd: 255.
	self internalPushInt32: _gsSqueakTemp_result