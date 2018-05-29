utility
adoptOriginalMethodCategoryNames

	self loadedInstanceMethods ifNotNil: [:methods |
		methods do: [:method |
			(self realClass compiledMethodAt: method selector ifAbsent: [nil])
				ifNotNil: [:originalMethod |
					method category: originalMethod methodReference category]]].
	self loadedClassMethods ifNotNil: [:methods |
		methods do: [:method |
			(self realClass theMetaClass compiledMethodAt: method selector ifAbsent: [nil])
				ifNotNil: [:originalMethod |
					method category: originalMethod methodReference category]]]