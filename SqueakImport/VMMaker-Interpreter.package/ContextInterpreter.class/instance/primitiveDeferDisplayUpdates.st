I/O primitives
primitiveDeferDisplayUpdates
	"Set or clear the flag that controls whether modifications of 
	the Display object are propagated to the underlying 
	platform's screen."
	| flag |
	flag := self stackTop.
	flag = objectMemory getTrueObj
		ifTrue: [deferDisplayUpdates := true]
		ifFalse: [flag = objectMemory getFalseObj
				ifTrue: [deferDisplayUpdates := false]
				ifFalse: [self primitiveFail]].
	self successful
		ifTrue: [self pop: 1]