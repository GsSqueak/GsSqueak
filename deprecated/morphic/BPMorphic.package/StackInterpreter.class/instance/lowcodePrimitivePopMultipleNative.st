inline primitive generated code
lowcodePrimitivePopMultipleNative
	"Lowcode instruction generator"
	| _gsSqueakTemp_popSize |
	_gsSqueakTemp_popSize := extA.
	self internalPopStackNativeSize: _gsSqueakTemp_popSize.
	extA := 0