internal interpreter access
methodUsesAlternateBytecodeSet: aMethodObj 
	"A negative header selects the alternate bytecode set."
	^ objectMemory
		headerIndicatesAlternateBytecodeSet: (objectMemory methodHeaderOf: aMethodObj)