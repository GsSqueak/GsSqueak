browse
browseMessageList: messageListOrBlock name: labelString autoSelect: autoSelectString
	"Create and schedule a MessageSet browser on the message list. If messageListOrBlock is a block, then evaluate it to get the message list."

	| messageList title |
	messageList := messageListOrBlock isBlock
		ifTrue: [ Cursor wait showWhile: messageListOrBlock ]
		ifFalse: [ messageListOrBlock ].
	messageList size = 0 ifTrue: [
		^self inform: 'There are no', String cr, labelString ].
	title := messageList size > 1
		ifFalse: [ labelString ]
		ifTrue: [ labelString, ' [', messageList size printString, ']' ].
	^ self toolset 
		browseMessageSet: messageList 
		name: title 
		autoSelect: autoSelectString