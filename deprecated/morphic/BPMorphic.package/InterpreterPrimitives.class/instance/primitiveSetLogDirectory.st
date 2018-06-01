I/O primitives
primitiveSetLogDirectory
	"Primitive. Set the VM's log directory"
	| _gsSqueakTemp_stringOop _gsSqueakTemp_sz |
	_gsSqueakTemp_stringOop := self stackTop.
	(objectMemory isBytes: _gsSqueakTemp_stringOop)
		ifFalse: [^ self success: false].
	_gsSqueakTemp_sz := objectMemory byteSizeOf: _gsSqueakTemp_stringOop.
	self
		ioSetLogDirectory: (objectMemory firstIndexableField: _gsSqueakTemp_stringOop)
		OfSize: _gsSqueakTemp_sz.
	self successful
		ifTrue: [self pop: self methodArgumentCount]