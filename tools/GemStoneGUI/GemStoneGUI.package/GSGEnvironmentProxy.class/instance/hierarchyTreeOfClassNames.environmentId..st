interface
hierarchyTreeOfClassNames: collectionOfSymbols environmentId: envId

	^ self interface 
		environment: self 
		hierarchyTreeOfClassNames: collectionOfSymbols
		env: envId