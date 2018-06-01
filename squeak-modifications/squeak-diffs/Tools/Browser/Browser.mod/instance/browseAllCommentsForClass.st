message functions
browseAllCommentsForClass
	"Opens a HelpBrowser on the class"

	| myClass |
	myClass := self selectedClassOrMetaClass ifNil: [ ^self ].
	myClass isTrait ifTrue: [ ^self ].
	(Smalltalk classNamed: #HelpBrowser)
		ifNil: [ ^self inform: 'HelpBrowser is not available.' ]
		ifNotNil: [ :HelpBrowser |
			HelpBrowser openOn: myClass theNonMetaClass ]
