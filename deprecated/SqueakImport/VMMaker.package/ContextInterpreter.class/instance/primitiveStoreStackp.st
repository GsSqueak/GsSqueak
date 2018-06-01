object access primitives
primitiveStoreStackp
	"Atomic store into context stackPointer. 
	Also ensures that any newly accessible cells are initialized to nil "
	| ctxt newStackp stackp |
	ctxt := self stackValue: 1.
	newStackp := self stackIntegerValue: 0.
	self success: (objectMemory oop: newStackp isGreaterThanOrEqualTo: 0).
	self success: (objectMemory oop: newStackp isLessThanOrEqualTo: (objectMemory largeContextSize - objectMemory baseHeaderSize // objectMemory bytesPerWord - CtxtTempFrameStart)).
	self successful ifFalse: [^ self primitiveFail].
	stackp := self fetchStackPointerOf: ctxt.
	(objectMemory oop: newStackp isGreaterThan: stackp) ifTrue: ["Nil any newly accessible cells"
			stackp + 1 to: newStackp do: [:i | objectMemory storePointer: i + CtxtTempFrameStart - 1 ofObject: ctxt withValue: objectMemory getNilObj]].
	self storeStackPointerValue: newStackp inContext: ctxt.
	self pop: 1