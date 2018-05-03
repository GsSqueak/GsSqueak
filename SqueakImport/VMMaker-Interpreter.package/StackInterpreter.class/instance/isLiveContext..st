frame access
isLiveContext: oop
	"Answer if the argument, which can be any object, is a live context."
	(self isContext: oop) ifFalse:
		[^false].
	(self isSingleContext: oop) ifTrue:
		[^self isIntegerObject: (self fetchPointer: InstructionPointerIndex ofObject: oop)].
	^(self isWidowedContext: oop) not