public
serialize: queryCode using: description

	self resolveDescription: description.
	^ self buildQuery: queryCode description: description