class initialization
cleanUp: aggressive
	"Clean out servers when doing aggressive cleanup"

	aggressive ifTrue:[self  resetServers].