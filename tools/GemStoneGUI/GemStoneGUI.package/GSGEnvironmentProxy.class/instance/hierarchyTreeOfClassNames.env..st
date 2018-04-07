classes and traits
hierarchyTreeOfClassNames: collectionOfSymbols env: envId

	self flag: #gsg2. "remove when hierarchy separation complete."
	^ self interface 
		environment: self 
		hierarchyTreeOfClassNames: collectionOfSymbols
		env: envId