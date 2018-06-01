query construction
buildQuery: queryCode description: description

	| query |
	query := self genericQueryTemplate format: {
		self Serializer sourceString.
		self transformationSource.
		self composites storeString.
		self rules storeString.
		queryCode.
		description storeString
		}.
	query := self condenseQuery: query.
	^ query withoutFirstLine