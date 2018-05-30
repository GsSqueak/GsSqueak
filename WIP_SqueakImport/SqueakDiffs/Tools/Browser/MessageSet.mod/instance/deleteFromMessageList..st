message functions
deleteFromMessageList: aMessage
	"Delete the given message from the receiver's message list"
	| currIdx |
	currIdx := self messageListIndex.
	messageList := messageList copyWithout: aMessage.
	messageList ifNotEmpty: [self messageListIndex: {currIdx. messageList size.} min]