new api - transactions
inTransaction

	| topazOutput |
	topazOutput := self run: 'System inTransaction'.
	^ self convertToBoolean: (topazOutput at: 1)