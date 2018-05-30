toolbuilder
buildSystemCategoryListWith: builder
	| listSpec |
	listSpec := builder pluggableListSpec new.
	listSpec 
		model: self;
		list: #systemCategoryList; 
		getIndex: #systemCategoryListIndex; 
		setIndex: #systemCategoryListIndex:; 
		menu: #systemCategoryMenu:; 
		keyPress: #systemCatListKey:from:.
	SystemBrowser browseWithDragNDrop ifTrue:[
		listSpec
			dropAccept: #wantsSystemCategoriesDrop:;
			dropItem: #dropOnSystemCategories:at:].
	^listSpec