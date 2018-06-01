old api - transactions
abortTransaction

	| topazOutput |
	topazOutput := self abort.
	^ topazOutput second isEmpty