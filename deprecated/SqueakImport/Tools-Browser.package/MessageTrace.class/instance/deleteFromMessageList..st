building
deleteFromMessageList: aMethodReference
	"Delete the given message from the receiver's message list"

	| index |
	autoSelectStrings removeAt: (index := messageList indexOf: aMethodReference).
	messageSelections removeAt: index.
	super deleteFromMessageList: aMethodReference.
	anchorIndex ifNotNil:
		[ anchorIndex := anchorIndex min: messageList size ]
