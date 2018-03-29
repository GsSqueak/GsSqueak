inline primitive generated code
lowcodePrimitiveCallArgumentSpace
	"Lowcode instruction generator"
	| _gsSqueakTemp_spaceSize |
	_gsSqueakTemp_spaceSize := extA.
	self internalPushShadowCallStackSpace: _gsSqueakTemp_spaceSize.
	extA := 0