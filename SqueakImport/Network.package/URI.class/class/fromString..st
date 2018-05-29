instance creation
fromString: aString
	| parseString scheme |
	parseString := aString withBlanksTrimmed.
	scheme := self extractSchemeFrom: parseString.
	^scheme
		ifNil: [HierarchicalURI new relativeFromString: aString]
		ifNotNil: [self absoluteFromString: aString scheme: scheme]
