*SqClasses-*SqClasses-*SqClasses-external objects
newExternalSemaphores: count 
	"Create and register multiple Semaphores, and return an array containing the semaphores and their indexes in separate arrays."

	^ExternalObjectTable current newExternalSemaphores: count
