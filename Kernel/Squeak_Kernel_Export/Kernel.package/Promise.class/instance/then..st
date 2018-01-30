monad
then: resolvedBlock
	^ self then: resolvedBlock ifRejected: [:ignored | "Do nothing"].