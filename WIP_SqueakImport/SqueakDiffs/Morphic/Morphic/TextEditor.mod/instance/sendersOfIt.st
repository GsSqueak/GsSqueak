menu messages
sendersOfIt
	"Open a senders browser on the selected selector"

	| aSelector |
	self lineSelectAndEmptyCheck: [^ self].
	(aSelector := self selectedSelector) == nil ifTrue: [^ morph flash].
	self systemNavigation browseAllCallsOn: aSelector