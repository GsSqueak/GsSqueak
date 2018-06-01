actions
removeMessage
	"Remove the selected messages from the system."
	self selectedMessages size = 0 ifTrue: [ ^self ].
	self selectedMessages size = 1 ifTrue: [ ^super removeMessage ].
	(self confirm: 'Are you certain you want to remove all of the selected methods from the image?') ifFalse: [ ^self ].
	self selectedMessages do:
		[ :each | 
		each actualClass removeSelector: each methodSymbol.
		self deleteFromMessageList: each ]