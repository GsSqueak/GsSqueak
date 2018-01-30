testing
isTerminated
	"Answer if the receiver is terminated, or at least terminating."
	self isActiveProcess ifTrue: [^ false].
	^suspendedContext isNil
	  or: ["If the suspendedContext is the bottomContext it is the block in Process>>newProcess.
		   If so, and the pc is at the endPC, the block has already sent and returned
		   from value and there is nothing more to do."
		suspendedContext isBottomContext
		and: [suspendedContext closure
						ifNil: [suspendedContext methodClass == Process
							and: [suspendedContext selector == #terminate]]
						ifNotNil: [suspendedContext pc >= suspendedContext closure endPC]]]