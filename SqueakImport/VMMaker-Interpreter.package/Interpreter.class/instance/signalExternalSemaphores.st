process primitive support
signalExternalSemaphores
	"Signal all requested semaphores"

	"n.b.StackInterpreter references doSignalExternalSemaphores implemented
	externally in the oscog platform sources Cross/vm/sqExternalSemaphores.c."

	self subclassResponsibility.