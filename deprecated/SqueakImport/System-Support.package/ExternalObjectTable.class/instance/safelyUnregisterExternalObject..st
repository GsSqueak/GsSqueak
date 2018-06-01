private
safelyUnregisterExternalObject: anObject

	(indexesByObjects removeKey: anObject ifAbsent: nil)
		ifNotNil: [ :index |
			(externalObjectsArray at: index) == anObject ifFalse: [
				"We're not in sync. Try again."
				^self
					synchronizeExternalObjectsArrayAndForceUpdate: true;
					safelyUnregisterExternalObject: anObject ].
			externalObjectsArray at: index put: nil.
			freeSlotIndexes add: index ]
		ifNil: [
			"Check if we're just out of sync."
			(externalObjectsArray instVarsInclude: anObject) ifFalse: [ ^self ].
			"We're not in sync. Try again."
			^self
				synchronizeExternalObjectsArrayAndForceUpdate: true;
				safelyUnregisterExternalObject: anObject ]