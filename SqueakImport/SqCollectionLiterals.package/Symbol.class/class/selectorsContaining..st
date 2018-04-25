access
selectorsContaining: aString
	"Answer a list of selectors that contain aString within them. Case-insensitive. Does return symbols that begin with a capital letter."

	| size selectorList |
	selectorList := OrderedCollection new.
	(size := aString size) = 0 ifTrue: [ ^selectorList ].
	self allSymbolTablesDo: [ :each |
		(each size >= size
			and: [ (each includesSubstring: aString caseSensitive: false) 
			and: [ each numArgs ~= -1 ] ])
				ifTrue: [ selectorList add: each ] ].
	^selectorList

	"Symbol selectorsContaining: 'scon'"