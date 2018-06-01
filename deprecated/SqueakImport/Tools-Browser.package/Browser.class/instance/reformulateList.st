message list
reformulateList
	"If the receiver has a way of reformulating its message list, here is a chance for it to do so"
	super reformulateList.
	(self messageList includes: self selectedMessageName)
		ifFalse: [ self messageList
					ifEmpty: [ self selectMessageNamed: nil ]
					ifNotEmpty: [ self selectMessageNamed: self lastMessageName ]].