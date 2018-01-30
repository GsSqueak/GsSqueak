mutual exclusion
critical: mutuallyExcludedBlock ifLocked: alternativeBlock
	"Evaluate mutuallyExcludedBlock only if the receiver is not currently in 
	the process of running the critical: message. If the receiver is, then evaluate 
	alternativeBlock and return."
	"See the comment of #critical: for the explanation how this pattern works
	before changing the code."

	| caught |
	caught := false.
	^[
		"We're using #== here instead of #=, because it won't introduce a
		suspension point, while #= may do that."
		excessSignals == 0
			ifTrue: [ alternativeBlock value ]
			ifFalse: [
				excessSignals := excessSignals - 1.
				caught := true.
				mutuallyExcludedBlock value ] ]
		ensure: [ caught ifTrue: [ self signal ] ]