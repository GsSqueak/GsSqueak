message list
messageList: someObjects

	messageList := someObjects.
	self changed: #messageList.
	
	self messageListIndex: (messageList size > 0
			ifTrue: [1]
			ifFalse: [0]).