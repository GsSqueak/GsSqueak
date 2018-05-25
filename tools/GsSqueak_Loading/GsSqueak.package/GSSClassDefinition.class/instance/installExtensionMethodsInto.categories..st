installing
installExtensionMethodsInto: class categories: categories

	self instanceMethods do: [:method |
		(method isExtension and: [method extensionCategoryMatchesAnyOf: categories])
			ifTrue: [method installInto: class theNonMetaClass]].
	self classMethods do: [:method |
		(method isExtension and: [method extensionCategoryMatchesAnyOf: categories])
			ifTrue: [method installInto: class theMetaClass]].