api
addSystemCategory: systemCategory

	| topazOutput |
	self setEnv: 0.
	topazOutput := self run: 'SystemOrganizer addCategory: ' , systemCategory.
	^ topazOutput at: 1