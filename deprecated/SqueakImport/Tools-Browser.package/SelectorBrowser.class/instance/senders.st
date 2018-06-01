selector functions
senders
	| aSelector |
	(aSelector := self selectedMessageName) ifNotNil:
		[self systemNavigation browseAllCallsOn: aSelector]