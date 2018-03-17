custom commands
messageCategoryDictFor: classProxy env: envId

	^ self convertToCategoryDict: (self messageCategoryHierarchyFor: classProxy env: envId)