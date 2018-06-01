toolbuilder
buildMessageListWith: builder
	| listSpec |
	listSpec := builder pluggableListSpec new.
	listSpec 
		model: self;
		list: #messageList; 
		getIndex: #messageListIndex; 
		setIndex: #messageListIndex:; 
		icon: #messageIconAt:;
		helpItem: #messageHelpAt:;
		menu: #messageListMenu:shifted:; 
		keyPress: #messageListKey:from:.
	SystemBrowser browseWithDragNDrop 
		ifTrue:[listSpec dragItem: #dragFromMessageList:].
	^listSpec
