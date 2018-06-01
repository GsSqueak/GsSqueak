message list
messageHelpAt: anIndex
	"Show the first n lines of the sources code of the selected message."
	Preferences balloonHelpInMessageLists ifFalse: [^ nil].
	self messageList size < anIndex ifTrue: [^ nil].
	^ self messageHelpFor: (self messageList at: anIndex)
