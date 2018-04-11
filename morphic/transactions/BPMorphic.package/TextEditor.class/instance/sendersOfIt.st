menu messages
sendersOfIt
	"Open a senders browser on the selected selector"
	| _gsSqueakTemp_aSelector |
	self
		lineSelectAndEmptyCheck: [^ self].
	(_gsSqueakTemp_aSelector := self selectedSelector) == nil
		ifTrue: [^ morph flash].
	self systemNavigation browseAllCallsOn: _gsSqueakTemp_aSelector