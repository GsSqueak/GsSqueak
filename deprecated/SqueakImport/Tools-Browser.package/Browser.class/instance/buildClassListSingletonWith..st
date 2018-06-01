toolbuilder
buildClassListSingletonWith: builder
	| listSpec |
	listSpec := builder pluggableListSpec new.
	listSpec 
		model: self;
		list: #classListSingleton; 
		getIndex: #indexIsOne; 
		setIndex: #indexIsOne:; 
		menu: #classListMenu:shifted:;
		keyPress: #classListKey:from:;
		hScrollBarPolicy: #never;
		vScrollBarPolicy: #never;
		minimumHeight: 0.
	^listSpec
