toolbuilder
buildPackageListWith: builder
	| listSpec |
	listSpec := builder pluggableListSpec new.
	listSpec 
		model: self;
		list: #packageList; 
		getIndex: #packageListIndex; 
		setIndex: #packageListIndex:; 
		menu: #packageMenu:; 
		keyPress: #packageListKey:from:.
	^listSpec
