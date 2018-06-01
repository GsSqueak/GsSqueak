message list
selectedMessageName
	^ self messageList at: messageListIndex ifAbsent: [nil]