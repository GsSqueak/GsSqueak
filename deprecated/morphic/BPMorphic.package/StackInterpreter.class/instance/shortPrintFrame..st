debug printing
shortPrintFrame: theFP 
	| _gsSqueakTemp_rcvr |
	(stackPages couldBeFramePointer: theFP)
		ifFalse: [self print: 'invalid frame pointer';
				 cr.
			^ nil].
	_gsSqueakTemp_rcvr := self frameReceiver: theFP.
	self printHexPtr: theFP.
	self space.
	self
		printActivationNameFor: (self frameMethod: theFP)
		receiver: _gsSqueakTemp_rcvr
		isBlock: (self frameIsBlockActivation: theFP)
		firstTemporary: (self temporary: 0 in: theFP).
	self space.
	self shortPrintOop: _gsSqueakTemp_rcvr
	"shortPrintOop: adds a cr"