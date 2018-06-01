selector functions
implementors
	| aSelector |
	(aSelector := self selectedMessageName) ifNotNil:
		[self systemNavigation browseAllImplementorsOf: aSelector]