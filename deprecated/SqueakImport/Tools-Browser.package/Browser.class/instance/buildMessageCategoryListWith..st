toolbuilder
buildMessageCategoryListWith: builder
	| listSpec |
	listSpec := builder pluggableListSpec new.
	listSpec 
		model: self;
		list: #messageCategoryList; 
		getIndex: #messageCategoryListIndex; 
		setIndex: #messageCategoryListIndex:; 
		menu: #messageCategoryMenu:; 
		keyPress: #messageCategoryListKey:from:.
	SystemBrowser browseWithDragNDrop ifTrue:[
		listSpec
			dropAccept: #wantsMessageCategoriesDrop:;
			dropItem: #dropOnMessageCategories:at:].
	^listSpec
