snapshots
shutDown: quitting

	quitting ifTrue: [
		Project current world triggerEvent: #aboutToLeaveWorld].