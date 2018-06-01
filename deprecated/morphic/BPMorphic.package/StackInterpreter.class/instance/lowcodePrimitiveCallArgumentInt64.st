inline primitive generated code
lowcodePrimitiveCallArgumentInt64
	"Lowcode instruction generator"
	| _gsSqueakTemp_value |
	_gsSqueakTemp_value := self internalPopStackInt64.
	self internalPushShadowCallStackInt64: _gsSqueakTemp_value