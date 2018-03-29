initialize-release
moduleUnloaded: aModuleName 
	"The module with the given name was just unloaded.
	Make sure we have no dangling references."
	(aModuleName strcmp: bbPluginName)
			= 0
		ifTrue: ["BitBlt just shut down. How nasty."
			loadBBFn := 0.
			copyBitsFn := 0]