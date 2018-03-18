classes and traits
hierarchyTreeOfClassNames: collectionOfSymbols env: envId

	^ self interface 
		environment: self 
		hierarchyTreeOfClassNames: collectionOfSymbols
		env: envId