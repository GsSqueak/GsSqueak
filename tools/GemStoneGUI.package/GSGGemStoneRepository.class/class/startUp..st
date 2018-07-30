system startup
startUp: resuming

	resuming ifTrue: [
		self terminateClosedInstances]