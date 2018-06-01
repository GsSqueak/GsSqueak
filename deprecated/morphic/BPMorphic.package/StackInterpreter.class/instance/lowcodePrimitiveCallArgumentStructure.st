inline primitive generated code
lowcodePrimitiveCallArgumentStructure
	"Lowcode instruction generator"
	| _gsSqueakTemp_structurePointer _gsSqueakTemp_structureSize |
	_gsSqueakTemp_structureSize := extA.
	_gsSqueakTemp_structurePointer := self internalPopStackPointer.
	self internalPushShadowCallStackStructure: _gsSqueakTemp_structurePointer size: _gsSqueakTemp_structureSize.
	extA := 0