message list
addItem: classAndMethod
	"Append a classAndMethod string to the list.  Select the new item."

	"Do some checks on the input?"
	self okToChange ifFalse: [^ self].
	messageList add: classAndMethod.
	self changed: #messageList.
	self messageListIndex: messageList size.