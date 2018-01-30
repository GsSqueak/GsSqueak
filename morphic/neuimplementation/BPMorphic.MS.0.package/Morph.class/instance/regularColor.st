accessing
regularColor
	^ (self valueOfProperty: #regularColor)
		ifNil: [owner
				ifNil: [self color]
				ifNotNil: [owner regularColor]]
		ifNotNil: [:val | val
				ifNil: [self error: 'nil regularColor']]