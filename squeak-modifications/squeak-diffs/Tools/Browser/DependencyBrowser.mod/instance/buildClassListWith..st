toolbuilder
buildClassListWith: builder
	| listSpec |
	listSpec := builder pluggableListSpec new.
	listSpec 
		model: self;
		name: 'Client classes' ;
		list: #classList; 
		getIndex: #classListIndex; 
		setIndex: #classListIndex:; 
		menu: #classListMenu:; 
		keyPress: #classListKey:from:.
	^listSpec
