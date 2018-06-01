inline primitive generated code
lowcodePrimitivePushOne32
	"Lowcode instruction generator"
	| _gsSqueakTemp_result |
	_gsSqueakTemp_result := 1.
	self internalPushInt32: _gsSqueakTemp_result