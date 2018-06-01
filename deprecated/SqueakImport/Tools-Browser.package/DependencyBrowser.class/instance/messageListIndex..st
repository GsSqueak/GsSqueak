message list
messageListIndex: idx
	"Message list selection"
	messageListIndex := idx.
	self changed: #messageListIndex.
	self changed: #contents.