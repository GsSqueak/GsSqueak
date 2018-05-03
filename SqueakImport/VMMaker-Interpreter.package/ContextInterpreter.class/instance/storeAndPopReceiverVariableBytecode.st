stack bytecodes
storeAndPopReceiverVariableBytecode
	"Note: This code uses 
	storePointerUnchecked:ofObject:withValue: and does the 
	store check explicitely in order to help the translator 
	produce better code."
	| rcvr top |
	self flag: #'requires currentBytecode to be expanded to a constant'.
	self fetchNextBytecode.
	"this bytecode will be expanded so that refs to currentBytecode below will be constant"
	rcvr := receiver.
	top := self internalStackTop.
	(objectMemory oop: rcvr isLessThan: objectMemory getYoungStart)
		ifTrue: [objectMemory possibleRootStoreInto: rcvr value: top].
	objectMemory storePointerUnchecked: (currentBytecode bitAnd: 7) ofObject: rcvr withValue: top.
	self internalPop: 1