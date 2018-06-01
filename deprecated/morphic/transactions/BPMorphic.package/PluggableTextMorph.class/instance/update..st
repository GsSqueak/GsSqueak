updating
update: aSymbol 
	aSymbol
		ifNil: [^ self].
	aSymbol == #flash
		ifTrue: [^ self flash].
	aSymbol == getTextSelector
		ifTrue: [self setText: self getText.
			getSelectionSelector
				ifNotNil: [self setSelection: self getSelection].
			^ self].
	aSymbol == getSelectionSelector
		ifTrue: [^ self setSelection: self getSelection].
	aSymbol == #acceptChanges
		ifTrue: [^ self accept].
	aSymbol == #revertChanges
		ifTrue: [^ self cancel].
	(aSymbol == #autoSelect
			and: [getSelectionSelector notNil])
		ifTrue: [self
				handleEdit: [textMorph editor abandonChangeText; setSearch: model autoSelectString; findAgain
					"no replacement!"]].
	aSymbol == #clearUserEdits
		ifTrue: [^ self hasUnacceptedEdits: false].
	aSymbol == #wantToChange
		ifTrue: [self canDiscardEdits
				ifFalse: [^ self promptForCancel].
			^ self].
	aSymbol == #appendEntry
		ifTrue: [self
				handleEdit: [self appendEntry].
			^ self refreshWorld].
	aSymbol == #appendEntryLater
		ifTrue: [self
				handleEdit: [self appendEntry]].
	aSymbol == #clearText
		ifTrue: [self
				handleEdit: [self changeText: Text new].
			^ self refreshWorld].
	aSymbol == #bs
		ifTrue: [self
				handleEdit: [self bsText].
			^ self refreshWorld].
	aSymbol == #codeChangedElsewhere
		ifTrue: [self hasEditingConflicts: true.
			^ self changed].
	aSymbol == #saveContents
		ifTrue: [^ self saveContentsInFile].
	aSymbol == #showContents
		ifTrue: [^ self scrollToTop]