server prefs
transferServerDefinitionsToExternal
	"ServerDirectory transferServerDefinitionsToExternal"

	| serverDir |
	serverDir := ExternalSettings preferenceDirectory directoryNamed: self serverConfDirectoryName.
	serverDir assureExistence.
	ServerDirectory storeCurrentServersIn: serverDir