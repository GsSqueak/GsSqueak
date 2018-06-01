accessing
registerClient: anObject
	"Register anObject as a settings client to be notified on startup."

	self registeredClients add: anObject