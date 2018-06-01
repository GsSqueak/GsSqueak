accessing
suspendWhile: aBlock
	| priorSuspended |
	priorSuspended := isSuspended.
	isSuspended := true.
	aBlock ensure: [ isSuspended := priorSuspended ]