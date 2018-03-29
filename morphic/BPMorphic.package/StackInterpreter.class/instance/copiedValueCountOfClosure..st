internal interpreter access
copiedValueCountOfClosure: closurePointer 
	"for Cogit"
	^ (objectMemory numSlotsOf: closurePointer)
		- ClosureFirstCopiedValueIndex