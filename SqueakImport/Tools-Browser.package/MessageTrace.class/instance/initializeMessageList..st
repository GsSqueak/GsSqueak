private initializing
initializeMessageList: anArray
	messageSelections := (Array new: anArray size withAll: false) asOrderedCollection.
	super initializeMessageList: anArray.
	self 
		messageAt: messageListIndex
		beSelected: true.
	"autoSelectStrings is initialized right after this method, in autoSelectString:"
