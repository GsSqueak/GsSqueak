button pane
browseSendersOfMessages
	"Present a menu of the currently selected message, as well as all messages sent by it.  Open a message set browser of all senders of the selector chosen."

	| selector messageList title labelString|
	selector := UIManager default request: 'Type selector:' initialAnswer: 'flag:'.
	selector := (selector copyWithout: Character space) asSymbol.
		^ selector isEmptyOrNil ifFalse: [
			messageList := self interface environment: self environment sendersOf: selector env: self envId.
			labelString := 'Senders of ' , selector.
			messageList size = 0 ifTrue: [
				^ self inform: 'There are no', String cr, labelString ].
				title := messageList size > 1
					ifFalse: [ labelString ]
					ifTrue: [ labelString, ' [', messageList size printString, ']' ].
			GSGToolSet 
				browseMessageSet: messageList
				name: title
				autoSelect: true]