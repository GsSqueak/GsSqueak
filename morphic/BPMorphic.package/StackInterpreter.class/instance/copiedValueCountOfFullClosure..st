internal interpreter access
copiedValueCountOfFullClosure: closurePointer 
	"for Cogit"
	^ (objectMemory numSlotsOf: closurePointer)
		- FullClosureFirstCopiedValueIndex