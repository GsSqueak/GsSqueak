validation
isInvalid

	^ self stoneNRS isEmptyOrNil
		or: [self gemNRS isEmptyOrNil]
		or: [self userID isEmptyOrNil]
		or: [self version isEmptyOrNil]