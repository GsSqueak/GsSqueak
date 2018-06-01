message category list
toggleCategorySelectionForCurrentMethod
	| methodCategory selectorName |
	methodCategory := self categoryOfCurrentMethod.
	selectorName := self selectedMessageName.
	(methodCategory notNil and:
		[ methodCategory ~= ClassOrganizer allCategory and: [ methodCategory ~= selectedMessageCategoryName ] ])
		ifTrue:
			[ selectedMessageCategoryName := methodCategory.
			selectedMessageName := selectorName.
			self changed: #messageCategorySelectionChanged.
			self changed: #messageCategoryListIndex.
			"update my selection"
			self changed: #messageList.
			self changed: #messageListIndex ]
		ifFalse:
			[ methodCategory = selectedMessageCategoryName ifTrue:
				[ selectedMessageCategoryName := nil.
				self
					 changed: #messageCategorySelectionChanged ;
					 changed: #messageCategoryListIndex ;
					 changed: #messageList ] ]