change set utilities
basicNewChangeSet: newName
	Smalltalk at: #ChangesOrganizer ifPresent: [ :cs | ^cs basicNewChangeSet: newName ].
	(self changeSetNamed: newName) ifNotNil: [ self inform: 'Sorry that name is already used'. ^nil ].
	^ChangeSet basicNewNamed: newName.