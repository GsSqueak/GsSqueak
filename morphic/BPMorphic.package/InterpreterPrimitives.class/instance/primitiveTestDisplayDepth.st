I/O primitives
primitiveTestDisplayDepth
	"Return true if the host OS does support the given display depth."
	| _gsSqueakTemp_bitsPerPixel _gsSqueakTemp_okay |
	_gsSqueakTemp_bitsPerPixel := self stackIntegerValue: 0.
	self successful
		ifTrue: [_gsSqueakTemp_okay := self ioHasDisplayDepth: _gsSqueakTemp_bitsPerPixel].
	self successful
		ifTrue: [self pop: 2 thenPushBool: _gsSqueakTemp_okay
			"Pop arg+rcvr"]