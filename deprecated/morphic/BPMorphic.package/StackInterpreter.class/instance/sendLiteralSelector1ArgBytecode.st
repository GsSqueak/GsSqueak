send bytecodes
sendLiteralSelector1ArgBytecode
	"Can use any of the first 16 literals for the selector."
	| _gsSqueakTemp_rcvr |
	messageSelector := self
				literal: (currentBytecode bitAnd: 15).
	argumentCount := 1.
	_gsSqueakTemp_rcvr := self internalStackValue: 1.
	lkupClassTag := objectMemory fetchClassTagOf: _gsSqueakTemp_rcvr.
	self assert: lkupClassTag ~= objectMemory nilObject.
	self commonSendOrdinary