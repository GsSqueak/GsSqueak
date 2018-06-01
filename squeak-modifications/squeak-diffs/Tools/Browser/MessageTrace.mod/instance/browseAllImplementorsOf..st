actions
browseAllImplementorsOf: selectorSymbol
	| selectorToBrowse |
	selectorToBrowse := self selection 
		ifNil: [ selectorSymbol ] 
		ifNotNil: [ self getImplementorNamed: selectorSymbol ].
	(self hasUnacceptedEdits or: [ Preferences traceMessages not ])
		ifTrue: [ super browseAllImplementorsOf: selectorToBrowse ]
		ifFalse: [ self addChildMethodsNamed: selectorToBrowse ]
