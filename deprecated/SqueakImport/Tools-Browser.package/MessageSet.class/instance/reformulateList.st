message functions
reformulateList
	"The receiver's messageList has been changed; rebuild it"
	super reformulateList.
	self
		 changed: #messageList ;
		 changed: #messageListIndex.
	self contentsChanged.
	autoSelectString ifNotNil: [ self changed: #autoSelect ]