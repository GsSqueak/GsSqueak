target directories
deleteUnwantedExternalPluginDirectories
	"delete directories in the external plugins tree with names not in the list  
	of external plugins. This will make sure that only wanted plugins are  
	left after generating external plugins - no previous ones will get left  
	there like unwanted porridge"
	(self externalPluginsDirectory directoryNames copyWithoutAll: self externalModuleNames)
		do: [:nm | (self externalPluginsDirectory directoryNamed: nm) recursiveDelete]