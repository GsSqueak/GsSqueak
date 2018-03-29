I/O primitives
primitiveSetWindowLabel
	"Primitive. Set the OS window's label"
	| _gsSqueakTemp_labelOop _gsSqueakTemp_sz |
	_gsSqueakTemp_labelOop := self stackTop.
	(objectMemory isBytes: _gsSqueakTemp_labelOop)
		ifFalse: [^ self success: false].
	_gsSqueakTemp_sz := objectMemory byteSizeOf: _gsSqueakTemp_labelOop.
	self
		ioSetWindowLabel: (objectMemory firstIndexableField: _gsSqueakTemp_labelOop)
		OfSize: _gsSqueakTemp_sz.
	self successful
		ifTrue: [self pop: self methodArgumentCount]