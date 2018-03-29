I/O primitives
primitiveGetWindowLabel
	"Primitive. Answer the OS window's label"
	| _gsSqueakTemp_ptr _gsSqueakTemp_sz _gsSqueakTemp_labelOop |
	_gsSqueakTemp_ptr := self ioGetWindowLabel.
	_gsSqueakTemp_ptr == nil
		ifTrue: [^ self success: false].
	_gsSqueakTemp_sz := self strlen: _gsSqueakTemp_ptr.
	_gsSqueakTemp_labelOop := objectMemory instantiateClass: objectMemory classString indexableSize: _gsSqueakTemp_sz.
	0
		to: _gsSqueakTemp_sz - 1
		do: [:i | objectMemory
				storeByte: i
				ofObject: _gsSqueakTemp_labelOop
				withValue: (_gsSqueakTemp_ptr at: i)].
	self pop: argumentCount + 1 thenPush: _gsSqueakTemp_labelOop