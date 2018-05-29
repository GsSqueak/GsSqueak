toolbuilder
buildClassListWith: builder
	| listSpec |
	listSpec := builder pluggableListSpec new.
	listSpec 
		model: self;
		list: #classList;
		getIndex: #classListIndex; 
		setIndex: #classListIndex:;
		icon: #classIconAt:; 
		menu: #classListMenu:shifted:; 
		keyPress: #classListKey:from:.
	SystemBrowser browseWithDragNDrop 
		ifTrue:[listSpec dragItem: #dragFromClassList:].

	^listSpec
