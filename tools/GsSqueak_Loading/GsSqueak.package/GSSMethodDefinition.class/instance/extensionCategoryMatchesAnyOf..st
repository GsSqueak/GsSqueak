testing
extensionCategoryMatchesAnyOf: categories

	| extensionCategory |
	extensionCategory := self category allButFirst.
	^ categories anySatisfy: [:prefix |
		self category: extensionCategory matches: prefix]