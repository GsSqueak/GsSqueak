accessing
newExternalSemaphore
	"Create and register a new Semaphore, and return an array containing itself and its index."

	| newSemaphore |
	^{
		newSemaphore := Semaphore new.
		semaphore critical: [
			self 
				synchronizeExternalObjectsArrayAndForceUpdate: false;
				safelyRegisterNewExternalObject: newSemaphore ] }