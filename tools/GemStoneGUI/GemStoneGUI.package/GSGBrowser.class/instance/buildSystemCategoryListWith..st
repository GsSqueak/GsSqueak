toolbuilder
buildSystemCategoryListWith: builder

	| listSpec |
	listSpec := builder pluggableListSpec new.
	listSpec 
		model: self;
		list: #systemCategoryList; 
		getIndex: #systemCategoryListIndex; 
		setIndex: #systemCategoryListIndex:;
		keyPress: #systemCatListKey:from:.
	^ listSpec