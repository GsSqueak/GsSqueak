inline primitive generated code
lowcodePrimitiveCallArgumentFloat64
	"Lowcode instruction generator"
	| _gsSqueakTemp_argumentValue |
	_gsSqueakTemp_argumentValue := self internalPopStackFloat64.
	self internalPushShadowCallStackFloat64: _gsSqueakTemp_argumentValue