interface 2
createLinkedClass: linkedClassName superclass: superclassName forGemstoneClass: aGsClass
	
	| query superclassSetter envId |
	envId := 7.
	superclassSetter := superclassName 
							ifNil: ['']
							ifNotNil: [
								'{1} superclassForEnv: {2} put: ({3}).
								{1} class superclassForEnv: {2} put: ({3}) class.
								Behavior _clearLookupCaches: 0.
								Behavior _clearLookupCaches: {2}'
									format: {aGsClass . envId . superclassName}].
	query := '
	{1} at: {2} put: ({3}).
	{4}
	' format: {
		self codeReferencingMe.
		linkedClassName asSymbol printString.
		aGsClass asString.
		superclassSetter
	}.