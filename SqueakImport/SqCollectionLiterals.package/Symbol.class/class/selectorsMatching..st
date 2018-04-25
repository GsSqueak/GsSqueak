access
selectorsMatching: aStringPattern
	"Answer a list of selectors that match aStringPattern within them. Case-insensitive. Does return symbols that begin with a capital letter."

	| selectorList |
	selectorList := OrderedCollection new.
	aStringPattern isEmpty ifTrue: [ ^selectorList ].
	self allSymbolTablesDo: [ :each | 
		((aStringPattern match: each) and: [ each numArgs ~= -1 ])
			ifTrue: [selectorList add: each ] ].
	^selectorList

	"Symbol selectorsMatching: 'parse:*'"