submenu - help
squeakHelp

	(Smalltalk classNamed: 'HelpBrowser')
		ifNil: [self inform: 'Sorry, there is no help system installed.' translated]
		ifNotNil: [:helpClass | helpClass open].