change set utilities
withCurrentChangeSetNamed: aString do: aOneArgumentBlock 
	"Evaluate the one-argument block aOneArgumentBlock while the named change set is active.
	We let the user confirm operating on an existing ChangeSet 
	or specify another ChangeSet name if 
	the name derived from the filename already exists. 
	Duplicated from SMSimpleInstaller. 
	Returns change set."

	| changeSet newName oldChanges |
	newName := aString.
	changeSet := self changeSetNamed: newName.
	changeSet ifNotNil: 
			[newName := UIManager default 
						request: 'ChangeSet already present, just confirm to overwrite or enter a new name:'
						initialAnswer: newName.
			newName isEmpty ifTrue: [self error: 'Cancelled by user'].
			changeSet := self changeSetNamed: newName].
	changeSet ifNil: [changeSet := self basicNewChangeSet: newName].
	changeSet 
		ifNil: [self error: 'User did not specify a valid ChangeSet name'].
	oldChanges := self currentChangeSet.
	
	[ self newChanges: changeSet.
	aOneArgumentBlock value: changeSet] 
			ensure: [ self newChanges: oldChanges].
	^changeSet