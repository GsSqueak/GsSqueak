mutual exclusion
critical: mutuallyExcludedBlock ifLocked: alternativeBlock

	^ semaphore _env0 critical: mutuallyExcludedBlock ifLocked: alternativeBlock
