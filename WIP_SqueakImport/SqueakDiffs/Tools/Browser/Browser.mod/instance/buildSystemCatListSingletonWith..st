toolbuilder
buildSystemCatListSingletonWith: builder
	| listSpec |
	listSpec := builder pluggableListSpec new.
	listSpec 
		model: self;
		list: #systemCategorySingleton; 
		getIndex: #indexIsOne; 
		setIndex: #indexIsOne:; 
		menu: #systemCategoryMenu:; 
		keyPress: #systemCatSingletonKey:from:;
		hScrollBarPolicy: #never;
		vScrollBarPolicy: #never;
		minimumHeight: 0.
	^listSpec