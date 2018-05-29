update
reformulateList
	"Reformulate the receiver's list.  Exclude methods now deleted"

	| currentSelection |
	messageListIndex > 0 ifTrue:
		[currentSelection := messageList at: messageListIndex].
	self initializeMessageList: (RecentMessages default methodReferences select: [:mr| mr isValid]).
	currentSelection ifNotNil:
		[messageListIndex := messageList indexOf: currentSelection ifAbsent: [1]].
	self
		changed: #messageList;
		changed: #messageListIndex