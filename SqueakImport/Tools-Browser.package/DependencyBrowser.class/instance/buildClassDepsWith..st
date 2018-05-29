toolbuilder
buildClassDepsWith: builder
	| listSpec |
	listSpec := builder pluggableListSpec new.
	listSpec 
		model: self;
		name: 'Required Classes' ;
		list: #classDeps; 
		getIndex: #classDepsIndex; 
		setIndex: #classDepsIndex:; 
		menu: #classDepsMenu:; 
		keyPress: #classDepsKey:from:.
	^listSpec
