old api - transactions
commitTransaction

	| topazOutput |
	topazOutput := self commit.
	^ topazOutput second isEmpty