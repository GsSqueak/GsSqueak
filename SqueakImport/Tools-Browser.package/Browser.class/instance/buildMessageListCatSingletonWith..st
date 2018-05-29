toolbuilder
buildMessageListCatSingletonWith: builder
	| listSpec |
	listSpec := builder pluggableListSpec new.
	listSpec 
		model: self;
		list: #messageCatListSingleton; 
		getIndex: #indexIsOne; 
		setIndex: #indexIsOne:; 
		menu: #messageCategoryMenu:;
		hScrollBarPolicy: #never;
		vScrollBarPolicy: #never;
		minimumHeight: 0.
	^listSpec
