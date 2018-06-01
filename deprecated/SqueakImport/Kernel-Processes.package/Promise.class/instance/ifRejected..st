monad
ifRejected: errBlock
	^ self then: [:ignored | "Do nothing"] ifRejected: errBlock.