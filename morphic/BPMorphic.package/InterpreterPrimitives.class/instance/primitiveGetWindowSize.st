I/O primitives
primitiveGetWindowSize
	"Primitive. Answer the OS window's size (extent)"
	| _gsSqueakTemp_w _gsSqueakTemp_h |
	_gsSqueakTemp_w := self ioGetWindowWidth.
	_gsSqueakTemp_h := self ioGetWindowHeight.
	self pop: self methodArgumentCount + 1.
	self
		push: (self makePointwithxValue: _gsSqueakTemp_w yValue: _gsSqueakTemp_h)