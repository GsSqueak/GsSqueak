class functions
createInstVarAccessors

	self selectedClassOrMetaClass
		ifNotNil: [:aClass | aClass createInstVarAccessors].
