monad
then: resolvedBlock
	^ self then: resolvedBlock ifRejected: [:e | "Pass rejection reason along" e].