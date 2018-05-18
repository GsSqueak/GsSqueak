testing
indicateKeyboardFocus

	^ (self hasProperty: #indicateKeyboardFocus)
		ifTrue: [(self valueOfProperty: #indicateKeyboardFocus) ~~ #never]
		ifFalse: [self class indicateKeyboardFocus]