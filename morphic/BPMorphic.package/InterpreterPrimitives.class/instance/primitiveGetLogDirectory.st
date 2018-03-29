I/O primitives
primitiveGetLogDirectory
	"Primitive. Answer the VM's current log directory"
	| _gsSqueakTemp_ptr _gsSqueakTemp_sz _gsSqueakTemp_stringOop |
	_gsSqueakTemp_ptr := self ioGetLogDirectory.
	_gsSqueakTemp_ptr == nil
		ifTrue: [^ self success: false].
	_gsSqueakTemp_sz := self strlen: _gsSqueakTemp_ptr.
	_gsSqueakTemp_stringOop := objectMemory instantiateClass: objectMemory classString indexableSize: _gsSqueakTemp_sz.
	0
		to: _gsSqueakTemp_sz - 1
		do: [:i | objectMemory
				storeByte: i
				ofObject: _gsSqueakTemp_stringOop
				withValue: (_gsSqueakTemp_ptr at: i)].
	self pop: argumentCount + 1 thenPush: _gsSqueakTemp_stringOop