inline primitive generated code
lowcodePrimitivePushZero64
	"Lowcode instruction generator"
	| _gsSqueakTemp_result |
	_gsSqueakTemp_result := 0.
	self internalPushInt64: _gsSqueakTemp_result