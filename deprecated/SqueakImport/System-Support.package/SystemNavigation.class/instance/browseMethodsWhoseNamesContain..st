browse
browseMethodsWhoseNamesContain: aString
	"Launch a tool which shows all methods whose names contain the given string; case-insensitive.
·	1/16/1996 sw, at the dawn of Squeak: this was the classic implementation that provided the underpinning for the 'method names containing it' (cmd-shift-W) feature that has always been in Squeak -- the feature that later inspired the MethodFinder (aka SelectorBrowser).
·	sw 7/27/2001:	Switched to showing a MessageNames tool rather than a message-list browser, if in Morphic."

	| aList |
	Smalltalk isMorphic
		ifFalse:
			[aList := Symbol selectorsContaining: aString.
			aList size > 0 ifTrue:
				[self browseAllImplementorsOfList: aList title: 'Methods whose names contain ''', aString, '''']]

		ifTrue:
			[ToolSet browseMessageNames: aString]
	