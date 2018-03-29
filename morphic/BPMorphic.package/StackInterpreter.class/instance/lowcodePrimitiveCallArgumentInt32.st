inline primitive generated code
lowcodePrimitiveCallArgumentInt32
	"Lowcode instruction generator"
	| _gsSqueakTemp_value |
	_gsSqueakTemp_value := self internalPopStackInt32.
	self internalPushShadowCallStackInt32: _gsSqueakTemp_value