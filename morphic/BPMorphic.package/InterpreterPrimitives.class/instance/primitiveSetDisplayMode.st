I/O primitives
primitiveSetDisplayMode
	"Set to OS to the requested display mode.
	See also DisplayScreen setDisplayDepth:extent:fullscreen:"
	| _gsSqueakTemp_fsFlag _gsSqueakTemp_h _gsSqueakTemp_w _gsSqueakTemp_d _gsSqueakTemp_okay |
	_gsSqueakTemp_fsFlag := self booleanValueOf: self stackTop.
	_gsSqueakTemp_h := self stackIntegerValue: 1.
	_gsSqueakTemp_w := self stackIntegerValue: 2.
	_gsSqueakTemp_d := self stackIntegerValue: 3.
	self successful
		ifTrue: [_gsSqueakTemp_okay := self cCode: 'ioSetDisplayMode(w, h, d, fsFlag)'].
	self successful
		ifTrue: [self pop: 5 thenPushBool: _gsSqueakTemp_okay
			"Pop args+rcvr"]