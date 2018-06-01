accessing
unregisterExternalObjects: aCollection
	"Unregister the given objects from the external objects array. Do nothing if they aren't registered."

	semaphore critical: [
		self synchronizeExternalObjectsArrayAndForceUpdate: false.
		aCollection do: [ :each |
			each ifNotNil: [
				self safelyUnregisterExternalObject: each ] ] ]