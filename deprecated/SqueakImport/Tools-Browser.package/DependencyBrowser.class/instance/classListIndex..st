class list
classListIndex: idx
	"Class list selection"
	classListIndex := idx.
	self messageListIndex: 0.
	self changed: #classListIndex.
	self changed: #messageList.
