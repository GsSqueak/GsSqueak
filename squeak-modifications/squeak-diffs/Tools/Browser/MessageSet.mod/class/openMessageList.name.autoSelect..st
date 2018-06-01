instance creation
openMessageList: messageList name: labelString autoSelect: autoSelectString
	"Open a system view for a MessageSet on messageList. 
	 1/24/96 sw: the there-are-no msg now supplied by my sender"

	| messageSet |
	messageSet := self messageList: messageList.
	messageSet autoSelectString: autoSelectString.
	^ToolBuilder open: messageSet label: labelString