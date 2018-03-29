inline primitive generated code
lowcodePrimitivePushZeroFloat64
	"Lowcode instruction generator"
	| _gsSqueakTemp_result |
	_gsSqueakTemp_result := 0.0.
	self internalPushFloat64: _gsSqueakTemp_result