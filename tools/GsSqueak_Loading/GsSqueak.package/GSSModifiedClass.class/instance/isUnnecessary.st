utility
isUnnecessary

	^ (self properties keys noneSatisfy: [:property |
		(#('name' 'category') includes: property) not])
		and: [self loadedInstanceMethods isEmpty]
		and: [self loadedClassMethods isEmpty]