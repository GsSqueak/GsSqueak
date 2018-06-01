exports
storeInternalPluginList
	| s fileName |
	fileName := self makefileDirectory fullNameFor: 'plugins.int'.
	[s := VMMaker forceNewFileNamed: fileName] 
		on: FileDoesNotExistException 
		do:[^self couldNotOpenFile: fileName].
	s nextPutAll:'# Automatically generated makefile include for internal plugins'.
	s cr; nextPutAll:'INTERNAL_PLUGINS ='.
	self internalPluginsDo:[:cls|
		s space; nextPutAll: cls moduleName.
	].
	s cr; close