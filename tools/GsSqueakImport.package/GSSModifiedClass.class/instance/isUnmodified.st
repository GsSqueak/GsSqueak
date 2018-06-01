utility
isUnmodified

	^ (self properties keys noneSatisfy: [:property |
		(#('name') includes: property) not])
		and: [self loadedInstanceMethods isEmpty]
		and: [self loadedClassMethods isEmpty]
		and: [self loadedComment isNil]