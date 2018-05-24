class initialization
initialize
	"AutoStart initialize"
	"Order: ExternalSettings, SecurityManager, AutoStart"
	Smalltalk addToStartUpList: AutoStart after: SecurityManager.
	Smalltalk addToShutDownList: AutoStart after: SecurityManager.