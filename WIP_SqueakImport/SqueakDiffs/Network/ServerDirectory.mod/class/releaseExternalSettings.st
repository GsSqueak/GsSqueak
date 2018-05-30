server prefs
releaseExternalSettings
	"Release for server configurations"
	"ServerDirectory releaseExternalSettings"

	(Preferences valueOfFlag: #externalServerDefsOnly)
		ifTrue: [
			self resetLocalProjectDirectories.
			Servers := Dictionary new]