processing external files
processFilesForInternalPlugin: plugin 
	"process any files relating to the internal plugin.
	This also provides a  stub ready for collecting all the filenames etc that might be needed to write a makefile, carefully weeding out any CVS related files. No details are yet certain."
	|fList|
	fList := OrderedCollection new.
	{self crossPlatformPluginsDirectory directoryNamed:  plugin moduleName.
	self platformPluginsDirectory directoryNamed:  plugin moduleName.
	self internalPluginsDirectoryFor: plugin}
		do:[:dir| fList addAll: (self nonAdminFilesIn: dir)].
	allFilesList at: plugin moduleName put: fList