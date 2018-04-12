toolbuilder
buildEnvironmentIdListWith: builder

	| listSpec |
	listSpec := builder pluggableListSpec new.
	listSpec 
		model: self;
		list: #environmentIdTextualList;
		getIndex: #environmentIdListIndex;
		setIndex: #environmentIdListIndex:.
	^ listSpec