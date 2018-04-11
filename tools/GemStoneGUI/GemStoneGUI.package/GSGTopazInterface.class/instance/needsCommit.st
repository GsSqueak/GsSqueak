new api - transactions
needsCommit

	| topazOutput |
	topazOutput := self run: 'System needsCommit'.
	^ self convertToBoolean: (topazOutput at: 1)