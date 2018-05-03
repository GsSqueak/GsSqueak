message sending
executeNewMethodFromCache
	"execute a method found in the mCache - which means that 
	primitiveIndex & primitiveFunctionPointer are already set. Any sender 
	needs to have previously sent findMethodInClass: or equivalent"
	| nArgs delta |
	primitiveIndex > 0
		ifTrue: [DoBalanceChecks ifTrue: ["check stack balance"
					nArgs := argumentCount.
					delta := stackPointer - activeContext].
			self initPrimCall.
			self dispatchFunctionPointer: primitiveFunctionPointer.
			"branch direct to prim function from address stored in mcache"
			DoBalanceChecks
				ifTrue: [(self balancedStack: delta afterPrimitive: primitiveIndex withArgs: nArgs)
						ifFalse: [self printUnbalancedStack: primitiveIndex]].
			self successful ifTrue: [^ nil]].
	"if not primitive, or primitive failed, activate the method"
	self activateNewMethod.
	"check for possible interrupts at each real send"
	self quickCheckForInterrupts