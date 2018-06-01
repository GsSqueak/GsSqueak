message functions
exploreMethod
	(self selectedClassOrMetaClass
		compiledMethodAt: self selectedMessageName
		ifAbsent: []) ifNotNil:
			[:method| method explore]