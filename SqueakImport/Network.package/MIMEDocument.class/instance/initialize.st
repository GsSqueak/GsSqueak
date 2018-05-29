testing
initialize

	parts := OrderedCollection new.
	fields := Dictionary new.
	self setField: 'content-type' toString: self class defaultContentType.