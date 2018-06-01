accessing
newExternalSemaphores: count
	"Create and register multiple Semaphores, and return an array containing the semaphores and their indexes in separate arrays."

	| semaphores indexes |
	semaphores := Array new: count.
	1 to: count do: [ :index | semaphores at: index put: Semaphore new ].
	indexes := Array new: count.
	semaphore critical: [
		self synchronizeExternalObjectsArrayAndForceUpdate: false.
		1 to: count do: [ :index |
			indexes at: index put: (
				self safelyRegisterNewExternalObject: (semaphores at: index)) ] ].
	^{ semaphores. indexes }