message list
messageListSelection
	"Message list selection"
	^(self messageListIndex between: 1 and: self messageList size)
		ifTrue:[self messageList at: self messageListIndex]