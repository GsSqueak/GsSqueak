validation
isValid

	^ self stoneNRS isString
		and: [self gemNRS isString]
		and: [self userID isString]
		and: [self version isString]
		and: [self password isString]