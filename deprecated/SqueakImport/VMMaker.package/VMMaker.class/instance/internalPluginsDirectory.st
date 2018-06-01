target directories
internalPluginsDirectory
	"return the directory for the internal plugins sources"

	UseSinglePluginsDirectory == true
		ifTrue: [^self externalPluginsDirectory "new directory structure, all plugins in src/plugins"]
		ifFalse: [ |fd| "original directory structure, internal and external in different directories"
			fd := self coreVMDirectory directoryNamed: 'intplugins'.
			fd assureExistence.
			^fd]