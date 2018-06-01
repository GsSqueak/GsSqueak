frame access
frameCallerStackPointer: theFP 
	"Answer the stack pointer of the caller frame."
	self assert: (self isBaseFrame: theFP) not.
	^ theFP
		+ (self frameStackedReceiverOffset: theFP) + objectMemory wordSize