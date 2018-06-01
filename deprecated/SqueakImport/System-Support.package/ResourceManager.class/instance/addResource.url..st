accessing
addResource: anObject url: urlString
	^self addResource: anObject locator: (ResourceLocator new urlString: urlString)