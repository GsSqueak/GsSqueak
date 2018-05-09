private - interpreter
evalSemaphore
	^ evalSemaphore
		ifNil: [TransientSemaphore forMutualExclusion]
