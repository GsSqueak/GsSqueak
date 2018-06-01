message sending
normalSend
	"Send a message, starting lookup with the receiver's class."
	"Assume: messageSelector and argumentCount have been set, and that 
	the receiver and arguments have been pushed onto the stack,"
	"Note: This method is inlined into the interpreter dispatch loop."
	| rcvr |
	<inline: true>
	self sharedCodeNamed: 'normalSend' inCase: 131.
	rcvr := self internalStackValue: argumentCount.
	lkupClass := objectMemory fetchClassOf: rcvr.
	receiverClass := lkupClass.
	self commonSend.