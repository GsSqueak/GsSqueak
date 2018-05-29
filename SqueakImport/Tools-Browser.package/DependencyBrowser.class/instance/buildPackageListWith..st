toolbuilder
buildPackageListWith: builder
	| listSpec |
	listSpec := builder pluggableListSpec new.
	listSpec 
		model: self;
		name: 'Packages' ;
		list: #packageList; 
		getIndex: #packageListIndex; 
		setIndex: #packageListIndex:; 
		menu: #packageListMenu:; 
		keyPress: #packageListKey:from:.
	^listSpec
