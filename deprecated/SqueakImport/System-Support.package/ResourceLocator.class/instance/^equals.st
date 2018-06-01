comparing
= aLocator

	^ self species == aLocator species and: [self urlString = aLocator urlString]
