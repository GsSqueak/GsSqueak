inline primitive generated code
lowcodePrimitiveCallArgumentPointer
	"Lowcode instruction generator"
	| _gsSqueakTemp_pointerValue |
	_gsSqueakTemp_pointerValue := self internalPopStackPointer.
	self internalPushShadowCallStackPointer: _gsSqueakTemp_pointerValue