toolbuilder
buildMessageListWith: builder

	| listSpec |
	listSpec := builder pluggableListSpec new.
	listSpec 
		model: self;
		list: #messageList; 
		getIndex: #messageListIndex; 
		setIndex: #messageListIndex:.
	^ listSpec