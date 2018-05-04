exports
storeExternalPluginList
	| s fileName |
	fileName := self makefileDirectory fullNameFor: 'plugins.ext'.
	[s := VMMaker forceNewFileNamed: fileName] 
		on: FileDoesNotExistException 
		do:[^self couldNotOpenFile: fileName].
	s nextPutAll:'# Automatically generated makefile include for external plugins'.
	s cr; nextPutAll:'EXTERNAL_PLUGINS ='.
	self externalPluginsDo:[:cls|
		s space; nextPutAll: cls moduleName.
	].
	s cr; close