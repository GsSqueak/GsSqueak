message sending
internalExecuteNewMethod
	| localPrimIndex delta nArgs |
	<inline: true>
	localPrimIndex := primitiveIndex.
	localPrimIndex > 0
		ifTrue: [(localPrimIndex > 255
					and: [localPrimIndex < 520])
				ifTrue: ["Internal return instvars"
					localPrimIndex >= 264
						ifTrue: [^ self internalPop: 1 thenPush: (objectMemory fetchPointer: localPrimIndex - 264 ofObject: self internalStackTop)]
						ifFalse: ["Internal return constants"
							localPrimIndex = 256 ifTrue: [^ nil].
							localPrimIndex = 257 ifTrue: [^ self internalPop: 1 thenPush: objectMemory getTrueObj].
							localPrimIndex = 258 ifTrue: [^ self internalPop: 1 thenPush: objectMemory getFalseObj].
							localPrimIndex = 259 ifTrue: [^ self internalPop: 1 thenPush: objectMemory getNilObj].
							^ self internalPop: 1 thenPush: (objectMemory integerObjectOf: localPrimIndex - 261)]]
				ifFalse: [self externalizeIPandSP.
					"self primitiveResponse. <-replaced with  manually inlined code"
					DoBalanceChecks
						ifTrue: ["check stack balance"
							nArgs := argumentCount.
							delta := stackPointer - activeContext].
					self initPrimCall.
					self dispatchFunctionPointer: primitiveFunctionPointer. "branch direct to prim function from address stored in mcache"
					DoBalanceChecks
						ifTrue: [(self balancedStack: delta afterPrimitive: localPrimIndex withArgs: nArgs)
								ifFalse: [self printUnbalancedStack: localPrimIndex]].
					self internalizeIPandSP.
					self successful
						ifTrue: [self browserPluginReturnIfNeeded.
							^ nil]]].
	"if not primitive, or primitive failed, activate the method"
	self internalActivateNewMethod.
	"check for possible interrupts at each real send"
	self internalQuickCheckForInterrupts