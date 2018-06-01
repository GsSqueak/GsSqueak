interface
systemCategories

	| query |
	query := (self codeForClassOrganizerInEnv: 0) , 'categories keys asArray sortAscending'.
	^ (self repository fetchArrayOfSymbols: query) sort