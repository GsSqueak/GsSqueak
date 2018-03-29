send bytecodes
normalSend
	"Send a message, starting lookup with the receiver's class."
	"Assume: messageSelector and argumentCount have been set, and
	that 
	the receiver and arguments have been pushed onto the stack,"
	"Note: This method is inlined into the interpreter dispatch loop."
	| _gsSqueakTemp_rcvr |
	_gsSqueakTemp_rcvr := self internalStackValue: argumentCount.
	lkupClassTag := objectMemory fetchClassTagOf: _gsSqueakTemp_rcvr.
	self assert: lkupClassTag ~= objectMemory nilObject.
	self commonSendOrdinary