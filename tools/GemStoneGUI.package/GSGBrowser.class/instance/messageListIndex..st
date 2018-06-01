message list
messageListIndex: anInteger
	"Set the selected message selector to be the one indexed by anInteger."

	self selectMessageNamed: (self messageList at: anInteger ifAbsent: [nil])