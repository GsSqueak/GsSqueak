compilation
chooseNewName
	"Choose a new name for the receiver, persisting until an acceptable name is provided or until the existing name is resubmitted"

	| oldName newName |
	oldName := self name.
		[newName := (UIManager default request: 'Please give this Model a name'
					initialAnswer: oldName) asSymbol.
		newName = oldName ifTrue: [^ self].
		Smalltalk includesKey: newName]
		whileTrue:
		[self inform: 'Sorry, that name is already in use.'].
	self rename: newName.