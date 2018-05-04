class initialization
initialize

	self initializeInterpreterTypes.
	Smalltalk at: #TheWorldMenu ifPresent: [ :class |
		class class methodDict at: #registerOpenCommand: ifPresent: [ :method |
			(method hasLiteral: #deprecated:) "n.b.  use #hasLiteral: rather than #sendsSelector: for Squeak 3.8"
				ifFalse: [ class registerOpenCommand: (Array with: 'VMMaker' with: (Array with: self with: #openInWorld)) ] ] ]