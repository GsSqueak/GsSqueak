submenu - help
openHelp: bookSymbol topic: topicSymbol styled: boolean

	| openSelector |
	openSelector := boolean ifTrue: [#openForCodeOn:] ifFalse: [#openOn:].

	(Smalltalk classNamed: 'HelpBrowser')
		ifNil: [self inform: 'Sorry, there is no help system installed.' translated]
		ifNotNil: [:helpClass |
			(Smalltalk classNamed: bookSymbol)
				ifNil: [self inform: 'Sorry, the help book you requested does not exist.']
				ifNotNil: [:book |
					topicSymbol
						ifNil: [(helpClass perform: openSelector with: book) model showFirstTopic]
						ifNotNil: [helpClass perform: openSelector with: (book perform: topicSymbol)]]]