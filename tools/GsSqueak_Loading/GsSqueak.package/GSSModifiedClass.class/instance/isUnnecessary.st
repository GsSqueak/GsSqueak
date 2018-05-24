utility
isUnnecessary

	^ (self properties keys noneSatisfy: [:property |
		(#('name' 'category') includes: property) not])
		and: [self loadedInstanceMethods isNil]
		and: [self loadedClassMethods isNil]