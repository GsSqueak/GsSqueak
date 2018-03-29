inline primitive generated code
lowcodePrimitivePushOne64
	"Lowcode instruction generator"
	| _gsSqueakTemp_result |
	_gsSqueakTemp_result := 1.
	self internalPushInt64: _gsSqueakTemp_result