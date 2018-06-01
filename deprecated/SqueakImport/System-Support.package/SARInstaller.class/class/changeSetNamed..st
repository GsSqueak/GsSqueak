change set utilities
changeSetNamed: newName
	Smalltalk at: #ChangesOrganizer ifPresent: [ :cs | ^cs changeSetNamed: newName ].
	^ChangeSet allInstances detect: [ :cs | cs name = newName ] ifNone: [ nil ].