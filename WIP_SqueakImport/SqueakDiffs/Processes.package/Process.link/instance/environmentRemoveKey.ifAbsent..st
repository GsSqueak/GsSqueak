*Kernel-Processes-process specific
environmentRemoveKey: key ifAbsent: errorBlock
    "GsSqueak does not support having more than one Environment"
	^ Smalltalk globals removeKey: key ifAbsent: errorBlock
