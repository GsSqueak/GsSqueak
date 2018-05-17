accessing
externalObjects
	"Return a copy of the externalObjectsArray."

	^semaphore critical: [
		self synchronizeExternalObjectsArrayAndForceUpdate: false.
		externalObjectsArray copy ]