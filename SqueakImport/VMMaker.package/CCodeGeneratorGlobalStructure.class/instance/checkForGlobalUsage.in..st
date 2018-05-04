utilities
checkForGlobalUsage: vars in: aTMethod 
	"override to handle global struct needs"
	super checkForGlobalUsage: vars in: aTMethod.
	"if localStructDef is false, we  don't ever need to include a reference to it in a function"
	localStructDef ifFalse:[^self].
	vars asSet do: [:var |
		"if any var is global and in the global var struct 
		tell the TMethod it will be refering to the  struct"
			  ((self globalsAsSet includes: var )
					and: [self placeInStructure: var ])
				ifTrue: [aTMethod referencesGlobalStructIncrementBy: (vars occurrencesOf: var)]]