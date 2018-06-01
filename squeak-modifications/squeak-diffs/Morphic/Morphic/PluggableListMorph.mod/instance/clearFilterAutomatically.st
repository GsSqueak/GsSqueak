accessing
clearFilterAutomatically

	^ (self valueOfProperty: #clearFilterAutomatically ifAbsent: [true]) and: [self class clearFilterAutomatically]