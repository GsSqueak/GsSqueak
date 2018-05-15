class initialization
initialize
	"ExternalSettings initialize"
	"Order: ExternalSettings, SecurityManager, AutoStart"
	Smalltalk addToStartUpList: self.
	Smalltalk addToShutDownList: self