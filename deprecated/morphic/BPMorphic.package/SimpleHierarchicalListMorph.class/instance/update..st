updating
update: aSymbol 
	aSymbol == getSelectionSelector
		ifTrue: [self selection: self getCurrentSelectionItem.
			^ self].
	aSymbol == getListSelector
		ifTrue: [self list: self getList.
			^ self].
	((aSymbol isKindOf: Array)
			and: [aSymbol notEmpty
					and: [aSymbol first == #openPath]])
		ifTrue: [^ (scroller submorphs
				at: 1
				ifAbsent: [^ self])
				openPath: aSymbol allButFirst]