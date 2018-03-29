I/O primitives
primitiveScreenDepth
	"Return a SmallInteger indicating the current depth of the OS screen.
	Negative values are used to imply LSB type pixel format an there is
	some support in the VM for handling either MSB or LSB"
	| _gsSqueakTemp_depth |
	_gsSqueakTemp_depth := self ioScreenDepth.
	self failed
		ifTrue: [^ self primitiveFail].
	self pop: 1 thenPushInteger: _gsSqueakTemp_depth