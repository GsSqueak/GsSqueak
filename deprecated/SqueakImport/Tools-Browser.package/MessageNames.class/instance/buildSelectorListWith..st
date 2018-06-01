toolbuilder
buildSelectorListWith: builder
	| listSpec |
	listSpec := builder pluggableListSpec new.
	listSpec 
		model: self;
		list: #selectorList; 
		getIndex: #selectorListIndex; 
		setIndex: #selectorListIndex:; 
		menu: #selectorListMenu:; 
		keyPress: #selectorListKey:from:.
	^listSpec
