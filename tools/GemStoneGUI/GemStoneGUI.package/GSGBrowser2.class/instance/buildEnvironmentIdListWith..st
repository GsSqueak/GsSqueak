toolbuilder
buildEnvironmentIdListWith: builder

	| listSpec |
	listSpec := builder pluggableListSpec new.
	listSpec 
		model: self;
		list: #environmentIdList;
		getIndex: #environmentIdListIndex;
		setIndex: #environmentIdListIndex:.
	^ listSpec