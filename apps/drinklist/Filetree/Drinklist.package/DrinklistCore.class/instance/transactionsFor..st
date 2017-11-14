as yet unclassified
transactionsFor: anUser

	^ self transactions select: [:trans | trans user = anUser ].