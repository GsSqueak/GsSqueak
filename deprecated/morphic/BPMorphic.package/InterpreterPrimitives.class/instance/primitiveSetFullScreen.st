I/O primitives
primitiveSetFullScreen
	"On platforms that support it, set full-screen mode to the value of the
	boolean argument."
	| _gsSqueakTemp_argOop |
	_gsSqueakTemp_argOop := self stackTop.
	_gsSqueakTemp_argOop = objectMemory trueObject
		ifTrue: [self ioSetFullScreen: true]
		ifFalse: [_gsSqueakTemp_argOop = objectMemory falseObject
				ifTrue: [self ioSetFullScreen: false]
				ifFalse: [self primitiveFail]].
	self successful
		ifTrue: [self pop: 1]