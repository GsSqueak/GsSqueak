*Kernel-Processes-mutual exclusion
critical: mutuallyExcludedBlock
	"Evaluate mutuallyExcludedBlock only if the receiver is not currently in
	the process of running the critical: message. If the receiver is, evaluate
	mutuallyExcludedBlock after the other critical: message is finished."
	
	^ self _env0 critical: mutuallyExcludedBlock
