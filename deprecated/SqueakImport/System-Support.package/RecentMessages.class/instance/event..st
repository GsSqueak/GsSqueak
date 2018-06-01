change logging
event: anEvent 
	"Hook for SystemChangeNotifier"
	(anEvent isCommented and: [ anEvent itemKind = SystemChangeNotifier classKind ]) ifTrue:
		[ self
			recordSelector: #Comment
			forClass: anEvent item
			inEnvironment: anEvent itemEnvironment ].
	((anEvent isAdded or: [ anEvent isModified ]) and: [ anEvent itemKind = SystemChangeNotifier methodKind ]) ifTrue:
		[ anEvent itemRequestor ifNotNil:
			[ self
				recordSelector: anEvent itemSelector
				forClass: anEvent itemClass
				inEnvironment: anEvent itemEnvironment ].
		InMidstOfFileinNotification signal ifFalse: [ Utilities changed: #recentMethodSubmissions ] ]