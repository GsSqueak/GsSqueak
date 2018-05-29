initialize-destroy
initializeSocketHandleUsing: aBlock
	"Initialize a new socket handle. If socket creation fails, socketHandle will be set to nil."
	
	| semaphoresAndIndexes semaphores indexes |
	semaphoresAndIndexes := Smalltalk newExternalSemaphores: 3.
	semaphores := semaphoresAndIndexes at: 1.
	indexes := semaphoresAndIndexes at: 2.
	semaphore := semaphores at: 1.
	readSemaphore := semaphores at: 2.
	writeSemaphore := semaphores at: 3.
	(socketHandle := aBlock valueWithArguments: indexes)
		ifNotNil: [ self register ]
		ifNil: [
			"socket creation failed"
			semaphore := readSemaphore := writeSemaphore := nil.
			Smalltalk unregisterExternalObjects: semaphores ]