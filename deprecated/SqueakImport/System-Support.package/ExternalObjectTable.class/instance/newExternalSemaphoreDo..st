accessing
newExternalSemaphoreDo: aBlock
	"Create and register a new Semaphore, then evaluate aBlock with it and its index."

	| newSemaphore |
	^aBlock
		value: (newSemaphore := Semaphore new)
		value: (semaphore critical: [
			self 
				synchronizeExternalObjectsArrayAndForceUpdate: false;
				safelyRegisterNewExternalObject: newSemaphore ])