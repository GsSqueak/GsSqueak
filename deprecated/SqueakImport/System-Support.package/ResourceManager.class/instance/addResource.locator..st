accessing
addResource: anObject locator: aLocator
	resourceMap at: aLocator put: anObject.
	loaded add: aLocator.