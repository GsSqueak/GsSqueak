toolbuilder
buildPackageDepsWith: builder
	| listSpec |
	listSpec := builder pluggableListSpec new.
	listSpec 
		model: self;
		name: 'Required Packages' ;
		list: #packageDeps; 
		getIndex: #packageDepsIndex; 
		setIndex: #packageDepsIndex:; 
		menu: #packageDepsMenu:; 
		keyPress: #packageDepsKey:from:.
	^listSpec
