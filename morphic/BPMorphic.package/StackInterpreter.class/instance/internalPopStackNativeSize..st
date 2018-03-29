internal interpreter access
internalPopStackNativeSize: popSize 
	"In the StackInterpreter stacks grow down."
	nativeSP := self nativeStackPointerIn: localFP.
	nativeSP := self nativeStackPointerIn: localFP put: nativeSP + popSize