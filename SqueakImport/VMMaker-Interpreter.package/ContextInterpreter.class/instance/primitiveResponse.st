primitive support
primitiveResponse

	| delta primIdx nArgs |
	DoBalanceChecks ifTrue:["check stack balance"
		nArgs := argumentCount.
		delta := stackPointer - activeContext.
	].
	primIdx := primitiveIndex.
	self initPrimCall.
	"self dispatchOn: primitiveIndex in: primitiveTable."
	self dispatchFunctionPointerOn: primIdx in: primitiveTable.
	"replace with fetch entry primitiveIndex from table and branch there"
	DoBalanceChecks ifTrue:[
		(self balancedStack: delta afterPrimitive: primIdx withArgs: nArgs) 
			ifFalse:[self printUnbalancedStack: primIdx].
	].
	self checkForInterrupts.
	primitiveIndex := 0. "clear out primIndex so VM knows we're no longer in primitive"
	^ primFailCode
