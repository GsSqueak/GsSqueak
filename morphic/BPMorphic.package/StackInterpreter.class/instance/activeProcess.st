process primitive support
activeProcess
	"Answer the current activeProcess."
	"useful for VM debugging"
	^ objectMemory fetchPointer: ActiveProcessIndex ofObject: self schedulerPointer