debug support
okayActiveProcessStack

	| cntxt |
	cntxt := activeContext.	
	[cntxt = objectMemory getNilObj] whileFalse: [
		self okayFields: cntxt.
		cntxt := (objectMemory fetchPointer: SenderIndex ofObject: cntxt).
	].