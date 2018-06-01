*Kernel-Processes-mutual exclusion
critical: mutuallyExcludedBlock ifLocked: alternativeBlock
	"Evaluate mutuallyExcludedBlock only if the receiver is not currently in 
	the process of running the critical: message. If the receiver is, then evaluate 
	alternativeBlock and return."
	"See the comment of #critical: for the explanation how this pattern works
	before changing the code."

	^ self _env0 semaphore _env0 critical: mutuallyExcludedBlock ifLocked: alternativeBlock
