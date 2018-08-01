system startup
terminateClosedInstances

	self instanceDict keys do: [:repository | repository terminate]