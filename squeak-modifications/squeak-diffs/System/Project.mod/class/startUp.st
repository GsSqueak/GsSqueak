snapshots
startUp: startAfresh
	Project current ifNil: [  MorphicProject new enter.].
	Project current restoreDisplay.

	startAfresh ifTrue: [
		Project current world triggerEvent: #aboutToEnterWorld]. 
