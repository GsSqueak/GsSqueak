message list
messageListIndex: anInteger 
	"Set the index of the selected item to be anInteger."

	messageListIndex := anInteger.
	contents := 
		messageListIndex ~= 0
			ifTrue: [self selectedMessage]
			ifFalse: [''].
	self changed: #messageListIndex.	 "update my selection"
	self editSelection: #editMessage.
	self contentsChanged.
	(messageListIndex ~= 0 and: [ autoSelectString notNil and: [ self contents notEmpty ] ]) ifTrue: [ self changed: #autoSelect ].
	self decorateButtons
