system startup
terminateClosedInstances

	self instanceDict keys do: [:repository |
		repository isClosed ifTrue: [repository unregister]]