instruction stream support
selectorToSendOrItselfFor: anInstructionStream in: method at: pc 
	"If anInstructionStream is at a send bytecode then answer the send's
	selector, otherwise answer anInstructionStream itself. The rationale
	for answering
	anInstructionStream instead of, say, nil, is that potentially any
	existing object
	can be used as a selector, but since anInstructionStream postdates
	the method,
	it can't be one of them."
	self subclassResponsibility