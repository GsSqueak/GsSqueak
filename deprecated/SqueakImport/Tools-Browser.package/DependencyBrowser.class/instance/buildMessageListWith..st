toolbuilder
buildMessageListWith: builder
	| listSpec |
	listSpec := builder pluggableListSpec new.
	listSpec 
		model: self;
		name: 'Client methods' ;
		list: #messageList; 
		getIndex: #messageListIndex; 
		setIndex: #messageListIndex:; 
		menu: #messageListMenu:; 
		keyPress: #messageListKey:from:.
	^listSpec
