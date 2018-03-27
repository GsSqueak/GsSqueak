button pane
browseMessageList: messageList name: labelString
	"Present a menu of the currently selected message, as well as all messages sent by it.  Open a message set browser of all senders of the selector chosen."

	| title |
	messageList size = 0 ifTrue: [
		^ self inform: 'There are no', String cr, labelString ].
	title := messageList size > 1
			ifFalse: [ labelString ]
			ifTrue: [ labelString, ' [', messageList size printString, ']' ].
	^ GSGToolSet
		browseMessageSet: messageList
		name: title
		autoSelect: nil