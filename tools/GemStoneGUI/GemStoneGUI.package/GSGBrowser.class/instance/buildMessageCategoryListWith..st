toolbuilder
buildMessageCategoryListWith: builder

	| listSpec |
	listSpec := builder pluggableListSpec new.
	listSpec 
		model: self;
		list: #messageCategoryList;
		getIndex: #messageCategoryListIndex; 
		setIndex: #messageCategoryListIndex:;
		menu: #messageCategoryMenu:.
	^ listSpec