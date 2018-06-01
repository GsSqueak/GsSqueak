private
safelyRegisterExternalObject: anObject

	| index |
	(index := indexesByObjects at: anObject ifAbsent: nil) ifNotNil: [
		(externalObjectsArray at: index) == anObject ifTrue: [ ^index ].
		"indexesByObjects is out of sync. Try again."
		^self
			synchronizeExternalObjectsArrayAndForceUpdate: true;
			safelyRegisterExternalObject: anObject ].
	^self safelyRegisterNewExternalObject: anObject