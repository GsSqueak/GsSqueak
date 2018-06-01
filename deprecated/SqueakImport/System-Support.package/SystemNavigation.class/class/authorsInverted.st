accessing
authorsInverted

	^ AuthorsInverted ifNil: [self initializeAuthors. AuthorsInverted]