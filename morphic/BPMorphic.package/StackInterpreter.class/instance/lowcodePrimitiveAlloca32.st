inline primitive generated code
lowcodePrimitiveAlloca32
	"Lowcode instruction generator"
	| _gsSqueakTemp_pointer _gsSqueakTemp_size |
	_gsSqueakTemp_size := self internalPopStackInt32.
	nativeStackPointer := self
				cCoerce: ((self cCoerce: nativeStackPointer - _gsSqueakTemp_size to: 'size_t')
						bitAnd: -16)
				to: 'char*'.
	_gsSqueakTemp_pointer := nativeStackPointer.
	self internalPushPointer: _gsSqueakTemp_pointer