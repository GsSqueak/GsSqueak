class initialization
shutDown
	"Look for external defs and load them."
	"ExternalSettings shutDown"

	self registeredClients do: [:client | 
		client releaseExternalSettings]