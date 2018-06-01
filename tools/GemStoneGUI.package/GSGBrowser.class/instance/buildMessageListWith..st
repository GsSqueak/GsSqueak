toolbuilder
buildMessageListWith: builder

	| listSpec |
	listSpec := builder pluggableListSpec new.
	listSpec 
		model: self;
		list: #messageList; 
		getIndex: #messageListIndex; 
		setIndex: #messageListIndex:;
		menu: #messageListMenu:shifted:.
	^ listSpec