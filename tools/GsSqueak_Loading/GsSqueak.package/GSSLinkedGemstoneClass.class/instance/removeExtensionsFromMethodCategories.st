utility
removeExtensionsFromMethodCategories

	self loadedInstanceMethods ifNotNil: [:methods |
		self removeExtensionsFromMethodCategories: methods].
	self loadedClassMethods ifNotNil: [:methods |
		self removeExtensionsFromMethodCategories: methods]