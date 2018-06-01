primitives
primitiveDrawLoop
	"Invoke the line drawing primitive."
	| _gsSqueakTemp_rcvr _gsSqueakTemp_xDelta _gsSqueakTemp_yDelta |
	<export: true>
	_gsSqueakTemp_rcvr := interpreterProxy stackValue: 2.
	_gsSqueakTemp_xDelta := interpreterProxy stackIntegerValue: 1.
	_gsSqueakTemp_yDelta := interpreterProxy stackIntegerValue: 0.
	(self loadBitBltFrom: _gsSqueakTemp_rcvr)
		ifFalse: [^ interpreterProxy primitiveFail].
	interpreterProxy failed
		ifFalse: [self drawLoopX: _gsSqueakTemp_xDelta Y: _gsSqueakTemp_yDelta.
			self showDisplayBits].
	interpreterProxy failed
		ifFalse: [interpreterProxy pop: 2]