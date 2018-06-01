class initialization
startUp
	"Look for external defs and load them."
	"ExternalSettings startUp"

	| prefDir |
	prefDir := self preferenceDirectory.
	prefDir
		ifNil: [^self].
	self registeredClients do: [:client | 
		client fetchExternalSettingsIn: prefDir]