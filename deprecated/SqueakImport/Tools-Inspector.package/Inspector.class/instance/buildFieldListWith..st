toolbuilder
buildFieldListWith: builder

	| listSpec |
	listSpec := builder pluggableListSpec new.
	listSpec 
		model: self;
		list: #fieldList; 
		getIndex: #selectionIndex; 
		setIndex: #toggleIndex:; 
		menu: #fieldListMenu:; 
		dragItem: #dragFromFieldList:;
		dropItem: #dropOnFieldList:at:;
		dropAccept: #wantsDropOnFieldList:type:source:;
		keyPress: #inspectorKey:from:.
	^listSpec