as yet unclassified
openMessageList: messageList name: labelString autoSelect: autoSelectString changeSet: aChangeSet
	| messageSet |
	messageSet := self messageList: messageList.
	messageSet changeSet: aChangeSet.
	messageSet autoSelectString: autoSelectString.
	ToolBuilder open: messageSet label: labelString.