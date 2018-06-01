class initialization
initialize
	"SecurityManager initialize"

	"Order: ExternalSettings, SecurityManager, AutoStart"

	Default := self new.
	Smalltalk addToStartUpList: self after: ExternalSettings.
	Smalltalk addToShutDownList: self