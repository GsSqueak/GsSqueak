accessing
noteSelectionIndex: anInteger for: aSymbol
	aSymbol == #systemCategoryList
		ifTrue:
			[self systemCategoryListIndex: anInteger].
	aSymbol == #classList
		ifTrue:
			[self classListIndex: anInteger].
	aSymbol == #messageCategoryList
		ifTrue:
			[self messageCategoryListIndex: anInteger].
	aSymbol == #messageList
		ifTrue:
			[self messageListIndex: anInteger].