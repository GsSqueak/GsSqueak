message functions
inspectMethod
	(self selectedClassOrMetaClass
		compiledMethodAt: self selectedMessageName
		ifAbsent: []) ifNotNil:
			[:method| method inspect]