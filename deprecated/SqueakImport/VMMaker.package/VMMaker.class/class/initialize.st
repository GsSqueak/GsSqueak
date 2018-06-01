initialisation
initialize
	"VMMaker initialize"
	DirNames := Dictionary new.
	DirNames at: #coreVMDir put: 'vm';
		at: #platformsDir put: 'platforms';
		at: #pluginsDir put: 'plugins';
		at: #sourceDir put: 'src'.

	self useSinglePluginsDirectory: true.	"new directory structure"
	"self useSinglePluginsDirectory: false."	"old directory structure"

	(self respondsTo: #initializeBrowserSupport)
		ifTrue: [self initializeBrowserSupport "see package SlangBrowser"]