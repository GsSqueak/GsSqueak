inline primitive generated code
lowcodePrimitiveTruncate32To8
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_result |
	_gsSqueakTemp_value := self internalPopStackInt32.
	_gsSqueakTemp_result := _gsSqueakTemp_value bitAnd: 255.
	self internalPushInt32: _gsSqueakTemp_result