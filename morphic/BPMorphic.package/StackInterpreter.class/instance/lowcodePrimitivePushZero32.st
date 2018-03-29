inline primitive generated code
lowcodePrimitivePushZero32
	"Lowcode instruction generator"
	| _gsSqueakTemp_result |
	_gsSqueakTemp_result := 0.
	self internalPushInt32: _gsSqueakTemp_result