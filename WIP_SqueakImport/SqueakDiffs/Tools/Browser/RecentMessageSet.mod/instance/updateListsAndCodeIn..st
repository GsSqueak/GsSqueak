update
updateListsAndCodeIn: aWindow 
	self canDiscardEdits ifFalse: [^self].
	RecentMessages default isEmpty ifTrue: [^self].
	(messageList isEmpty
	 or: [RecentMessages default mostRecent = messageList first and: [RecentMessages default mostRecent isValid]])
		ifTrue: [self updateCodePaneIfNeeded]
		ifFalse: [self reformulateList]