inline primitive generated code
lowcodePrimitiveCallArgumentFloat32
	"Lowcode instruction generator"
	| _gsSqueakTemp_argumentValue |
	_gsSqueakTemp_argumentValue := self internalPopStackFloat32.
	self internalPushShadowCallStackFloat32: _gsSqueakTemp_argumentValue