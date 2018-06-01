plugin support
classMutex
	"Used by StackInterpreter>>printAllStacks, but see initializeSpecialObjectsArray
	for initialization of CassMutex. Slot 39 in the array is presently used for class
	PseudoContext, which is obsolete but may be needed for running older images."

	self flag: #FIXME. "ClassMutex is not initialized."
	^self splObj: ClassMutex