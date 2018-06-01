internal interpreter access
internalPushShadowCallStackSpace: spaceSize 
	"In the StackInterpreter stacks grow down."
	shadowCallStackPointer := shadowCallStackPointer - spaceSize