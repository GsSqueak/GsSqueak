toolbuilder
buildSymbolDictionaryListWith: builder

	| listSpec |
	listSpec := builder pluggableListSpec new.
	listSpec 
		model: self;
		list: #symbolDictionaryList; 
		getIndex: #symbolDictionaryListIndex; 
		setIndex: #symbolDictionaryListIndex:.
	^ listSpec