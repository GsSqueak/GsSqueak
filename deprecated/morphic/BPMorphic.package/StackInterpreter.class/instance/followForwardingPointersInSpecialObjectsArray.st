object memory support
followForwardingPointersInSpecialObjectsArray
	"Various semaphores in the specialObjectsArray are signalled in
	checkForEventsMayContextSwitch:. These must be followed post
	become to avoid a read barrier in checkForEventsMayContextSwitch:,
	or worse still in synchronousSignal."
	| _gsSqueakTemp_xArray |
	self followSemaphoreIn: objectMemory specialObjectsOop at: TheLowSpaceSemaphore.
	self followSemaphoreIn: objectMemory specialObjectsOop at: TheInterruptSemaphore.
	self followSemaphoreIn: objectMemory specialObjectsOop at: TheTimerSemaphore.
	self followSemaphoreIn: objectMemory specialObjectsOop at: TheFinalizationSemaphore.
	_gsSqueakTemp_xArray := objectMemory splObj: ExternalObjectsArray.
	(objectMemory isForwarded: _gsSqueakTemp_xArray)
		ifTrue: [_gsSqueakTemp_xArray := objectMemory followForwarded: _gsSqueakTemp_xArray.
			objectMemory splObj: ExternalObjectsArray put: _gsSqueakTemp_xArray].
	0
		to: (objectMemory numSlotsOf: _gsSqueakTemp_xArray)
				- 1
		do: [:i | self followSemaphoreIn: _gsSqueakTemp_xArray at: i]