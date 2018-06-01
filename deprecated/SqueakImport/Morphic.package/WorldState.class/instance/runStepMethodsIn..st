stepping
runStepMethodsIn: aWorld
	"Perform periodic activity inbetween event cycles"
	| queue msg limit stamp |
	"Limit processing of deferredUIMessages to a max. amount of time"
	limit := self class deferredExecutionTimeLimit.
	stamp := Time millisecondClockValue.
	queue := self class deferredUIMessages.
	[(Time millisecondsSince: stamp) >= limit 
		or:[(msg := queue nextOrNil) == nil]] 
			whileFalse: [msg value].
	self runLocalStepMethodsIn: aWorld.
