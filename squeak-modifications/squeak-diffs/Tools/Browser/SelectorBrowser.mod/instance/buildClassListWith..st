toolbuilder
buildClassListWith: builder
	| listSpec |
	listSpec := builder pluggableListSpec new.
	listSpec 
		model: self;
		list: #classList; 
		getIndex: #classListIndex; 
		setIndex: #classListIndex:; 
		keyPress: #arrowKey:from:.
	^listSpec
