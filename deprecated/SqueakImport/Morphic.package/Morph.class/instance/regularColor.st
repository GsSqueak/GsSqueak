accessing
regularColor
	
	| val |
	^ (val := self valueOfProperty: #regularColor)
		ifNotNil:
			[val ifNil: [self error: 'nil regularColor']]
		ifNil:
			[owner ifNil: [self color] ifNotNil: [owner regularColor]]