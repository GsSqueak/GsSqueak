utility
adoptOriginalMethodCategoryNames

	self loadedInstanceMethods do: [:method |
			(self realClass compiledMethodAt: method selector ifAbsent: [nil])
				ifNotNil: [:originalMethod |
					method category: originalMethod methodReference category]].
	self loadedClassMethods do: [:method |
			(self realClass theMetaClass compiledMethodAt: method selector ifAbsent: [nil])
				ifNotNil: [:originalMethod |
					method category: originalMethod methodReference category]]