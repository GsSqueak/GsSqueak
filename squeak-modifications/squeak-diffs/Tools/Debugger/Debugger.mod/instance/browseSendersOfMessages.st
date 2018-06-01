context stack menu
browseSendersOfMessages
	"Present a menu of the currently selected message, as well as all
	messages sent by it.  Open a message set browser of all senders
	of the message chosen."

	contextStackIndex = 0 ifTrue: [^ self].
	self withSelectorAndMessagesIn: self selectedContext method
		evaluate: [:selector| self systemNavigation browseAllCallsOn: selector]