scripts-standard
changeScript: scriptName toStatus: statusSymbol 
	"Change the script of the given name to have the given status, and
	get all relevant script-status controls updated"
	scriptName
		ifNil: [^ self].
	Symbol
		hasInterned: scriptName
		ifTrue: [:sym | self
				instantiatedUserScriptsDo: [:aScriptInstantiation | aScriptInstantiation selector == sym
						ifTrue: [aScriptInstantiation status: statusSymbol.
							aScriptInstantiation updateAllStatusMorphs]]]