class functions
renameClass
	| oldName newName obs oldBinding |
	self hasClassSelected ifFalse: [^ self].
	self okToChange
		ifFalse: [^ self].
	oldName := self selectedClass name.
	newName := self request: 'Please type new class name' initialAnswer: oldName.
	newName = ''
		ifTrue: [^ self].
	"Cancel returns ''"
	newName := newName asSymbol.
	newName = oldName
		ifTrue: [^ self].
	(self selectedClass environment includesKey: newName)
		ifTrue: [^ self error: newName , ' already exists'].
	oldBinding := self selectedClass environment declarationOf: oldName.
	self selectedClass rename: newName.
	selectedClassName := newName.
	self changed: #classList.
	obs := self systemNavigation allCallsOn: oldBinding.
	obs isEmpty
		ifFalse: [self systemNavigation
				browseMessageList: obs
				name: 'Obsolete References to ' , oldName
				autoSelect: oldName].
	self selectClassNamed: newName.