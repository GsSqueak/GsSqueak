*Kernel-Processes-process specific
environmentAt: key 
	^ self environmentAt: key ifAbsent: [self environmentKeyNotFound]
