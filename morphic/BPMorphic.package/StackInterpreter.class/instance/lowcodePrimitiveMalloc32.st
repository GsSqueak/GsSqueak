inline primitive generated code
lowcodePrimitiveMalloc32
	"Lowcode instruction generator"
	| _gsSqueakTemp_pointer _gsSqueakTemp_size |
	_gsSqueakTemp_size := self internalPopStackInt32.
	_gsSqueakTemp_pointer := self malloc: _gsSqueakTemp_size.
	self internalPushPointer: _gsSqueakTemp_pointer