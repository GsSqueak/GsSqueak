I/O primitives
primitiveSetWindowSize
	"Primitive. Answer the OS window's size (extent)"
	| _gsSqueakTemp_w _gsSqueakTemp_h |
	_gsSqueakTemp_h := self stackIntegerValue: 0.
	_gsSqueakTemp_w := self stackIntegerValue: 1.
	self successful
		ifTrue: [self ioSetWindowWidth: _gsSqueakTemp_w Height: _gsSqueakTemp_h.
			self pop: self methodArgumentCount]