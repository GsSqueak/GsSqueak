*SqNumbers-truncation and round off
atRandom
	"Answer a random integer from 1 to self.  This implementation uses the process-local random number generator."

	self isZero ifTrue: [ ^0 ].
	self negative ifTrue: [ ^self negated atRandom negated ].
	^self atRandom: ThreadSafeRandom value