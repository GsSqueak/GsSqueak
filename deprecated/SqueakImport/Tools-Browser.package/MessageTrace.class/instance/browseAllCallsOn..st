actions
browseAllCallsOn: selectorSymbol
	(self hasUnacceptedEdits or: [ Preferences traceMessages not ])
		ifTrue: [ super browseAllCallsOn: selectorSymbol ]
		ifFalse: [ self addParentMethodsSending: selectorSymbol ]