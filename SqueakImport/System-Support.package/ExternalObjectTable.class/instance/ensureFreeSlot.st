private
ensureFreeSlot
	"Make sure there's at least one free slot."

	| oldSize newSize newExternalObjectsArray specialObjectsArray |
	freeSlotIndexes isEmpty ifFalse: [ ^self ].
	oldSize := externalObjectsArray size.
	newSize := oldSize + 20. "Linear growth is not really a problem, because we never shrink the array."
	newExternalObjectsArray := externalObjectsArray species new: newSize.
	newExternalObjectsArray
		replaceFrom: 1
		to: oldSize
		with: externalObjectsArray
		startingAt: 1.
	specialObjectsArray := Smalltalk specialObjectsArray.
	(specialObjectsArray at: 39) == externalObjectsArray
		ifFalse: [
			"We're not in sync. Try again."
			^self
				synchronizeExternalObjectsArrayAndForceUpdate: true;
				ensureFreeSlot ].
	specialObjectsArray at: 39 put: newExternalObjectsArray.
	externalObjectsArray := newExternalObjectsArray.
	newSize to: oldSize + 1 by: -1 do: [ :each |
		freeSlotIndexes addFirst: each ].
	Smalltalk maxExternalSemaphores ifNotNil: [ :maxExternalSemaphores |
		"Make sure that those new external semaphores can be signaled by the VM. This is not entirely safe, but not incrementing at all is worse."
		newSize > maxExternalSemaphores ifTrue: [
			Smalltalk maxExternalSemaphores: newSize ] ]	

	