external objects
newExternalSemaphoreDo: aBlock 
	"Create and register a new Semaphore, then evaluate aBlock with it and its index."

	^ExternalObjectTable current newExternalSemaphoreDo: aBlock