scripts-standard
assignStatus: newStatus toAllFor: scriptName 
	"Change the status of my script of the given name to be as specified in
	me and all of my siblings."
	(self existingScriptInstantiationForSelector: scriptName)
		ifNotNil: [:scriptInstantiation | 
			scriptInstantiation status: newStatus.
			scriptInstantiation assignStatusToAllSiblings.
			^ self costume world
				ifNotNil: [:_gsSqueakTemp_aWorld | _gsSqueakTemp_aWorld updateStatusForAllScriptEditors]]