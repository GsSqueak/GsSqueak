private
safelyRegisterNewExternalObject: anObject

	| index |
	self ensureFreeSlot.
	index := freeSlotIndexes removeLast.
	(externalObjectsArray at: index) ifNotNil: [
		"Free slot is not empty. Try again."
		^self 
			synchronizeExternalObjectsArrayAndForceUpdate: true;
			safelyRegisterNewExternalObject: anObject ].
	externalObjectsArray at: index put: anObject.
	indexesByObjects at: anObject put: index.
	^index