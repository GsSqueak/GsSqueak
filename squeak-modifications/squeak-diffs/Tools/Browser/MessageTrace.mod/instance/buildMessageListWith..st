private initializing
buildMessageListWith: builder
	| listSpec |
	listSpec := builder pluggableAlternateMultiSelectionListSpec new.
	listSpec 
		model: self ;
		list: #messageList ;
		getIndex: #messageListIndex ;
		setIndex: #toggleSelectionAt:shifted:controlled: ;
		icon: #messageIconAt:;
		help: #messageHelpAt:; 
		menu: #messageListMenu:shifted: ; 
		getSelectionList: #isMessageSelectedAt: ;
		setSelectionList: #messageAt:beSelected: ;
		keyPress: #messageListKey:from:.
	SystemBrowser browseWithDragNDrop 
		ifTrue: [ listSpec dragItem: #dragFromMessageList: ].
	^ listSpec