*Env0Extensions
critical: mutuallyExcludedBlock ifLocked: alternativeBlock
	"Evaluate mutuallyExcludedBlock only if the receiver is not currently in 
	the process of running the critical: message. If the receiver is, then evaluate 
	alternativeBlock and return."
	"See the comment of #critical: for the explanation how this pattern works
	before changing the code."

	0 == signalCount ifTrue: [ ^alternativeBlock value ].
	signalCount := signalCount - 1.
	^mutuallyExcludedBlock ensure: [ self signal ]
