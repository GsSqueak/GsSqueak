as yet unclassified
openFor: aChangeSet
	"Open up a ChangedMessageSet browser on the given change set; this is a conventional message-list browser whose message-list consists of all the methods in aChangeSet.  After any method submission, the message list is refigured, making it plausibly dynamic"

	| messageSet |

	messageSet := aChangeSet changedMessageListAugmented select: [ :each | each isValid].
	self 
		openMessageList: messageSet 
		name: 'Methods in Change Set ', aChangeSet name
		autoSelect: nil
		changeSet: aChangeSet