message category dict
invalidateMessageCategoryDict

	messageCategoryDict := self currentMessageCategoryDict.
	self reselectMessageCategory.
	self changed: #messageCategoryList