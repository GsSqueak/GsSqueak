system category list
invalidateSystemCategoryList

	systemCategoryList := self currentSystemCategoryList.
	self reselectSystemCategory.
	self changed: #systemCategoryList