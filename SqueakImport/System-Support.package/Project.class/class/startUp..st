snapshots
startUp: startAfresh

	Project current restoreDisplay.

	startAfresh ifTrue: [
		Project current world triggerEvent: #aboutToEnterWorld].