query
allImplementedMessages
	"Answer a set of all the messages that are implemented in the system."
	
	^self allImplementedMessagesWithout: #(() ())