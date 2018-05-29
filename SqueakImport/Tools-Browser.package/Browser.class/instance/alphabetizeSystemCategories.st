system category functions
alphabetizeSystemCategories

	self okToChange ifFalse: [^ false].
	systemOrganizer sortCategories.
	self selectSystemCategory: nil.
	self changed: #systemCategoryList.
