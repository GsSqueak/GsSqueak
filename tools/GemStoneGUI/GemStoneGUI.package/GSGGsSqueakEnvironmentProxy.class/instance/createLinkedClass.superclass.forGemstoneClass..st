interface 2
createLinkedClass: linkedClassName superclass: superclassName forGemstoneClass: aGsClass
	
	| query superclassSetter envId |
	envId := 7.
	superclassSetter := superclassName 
							ifNil: ['']
							ifNotNil: [
								'| environment |
								environment := {1}.
								{2} superclassForEnv: {3} put: (environment classNamed: {4}).
								{2} class superclassForEnv: {3} put: (environment classNamed: {4}) class.
								Behavior _clearLookupCaches: 0.
								Behavior _clearLookupCaches: {3}'
									format: {
										self codeReferencingMe.
										aGsClass.
										envId.
										superclassName storeString}].
	query := '
	{1} at: {2} put: ({3}).
	[{4}] value.
	{3}
	' format: {
		self codeReferencingMe.
		linkedClassName asSymbol storeString.
		aGsClass.
		superclassSetter
	}.
	^ self fetchClass: query.