accessing
unregisterExternalObject: anObject
	"Unregister the given object from the external objects array. Do nothing if it isn't registered."

	anObject ifNil: [ ^self ].
	semaphore critical: [
		self 
			synchronizeExternalObjectsArrayAndForceUpdate: false;
			safelyUnregisterExternalObject: anObject ]