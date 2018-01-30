testing
isSuspended
	"A process is suspended if it has been suspended with the suspend primitive.
	 It is distinguishable from the active process and a terminated process by
	 having a non-nil suspendedContext that is either not the bottom context
	 or has not reached its endPC."
	^nil == myList
	  and: [nil ~~ suspendedContext
	  and: [suspendedContext isBottomContext
			ifTrue: [suspendedContext closure
						ifNil: [suspendedContext methodClass ~~ Process
							or: [suspendedContext selector ~~ #terminate]]
						ifNotNil: [suspendedContext pc < suspendedContext closure endPC]]
			ifFalse: [true]]]