accessing
authors

	^ Authors ifNil: [self initializeAuthors. Authors]