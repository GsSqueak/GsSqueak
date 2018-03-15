class list
selectClassNamed: aSymbolOrString

	selectedClassName := aSymbolOrString ifNotNil: [ aSymbolOrString asSymbol ].
	self setClassOrganizer.
	self setClassDefinition.
	
	"Try to reselect the category and/or selector if the new class has them."
	(self messageCategoryList includes: selectedMessageCategoryName) ifFalse: [selectedMessageCategoryName := nil].
	(self messageList includes: selectedMessageName) ifFalse: [selectedMessageName := nil].

	self hasMessageSelected ifTrue:
		[self editSelection: #editMessage] ifFalse:
	[self hasMessageCategorySelected ifTrue:
		[self editSelection: #newMessage] ifFalse:
	[self classCommentIndicated
		ifTrue: [self editSelection: #editComment]
		ifFalse: [self editSelection: (self hasClassSelected not
					ifTrue: [(metaClassIndicated or: [ self hasSystemCategorySelected not ])
						ifTrue: [#none]
						ifFalse: [#newClass]]
					ifFalse: [#editClass])]]].
	contents := nil.
	
	self changed: #classSelectionChanged.
	self changed: #classCommentText.
	self changed: #classListIndex.	"update my selection"
	self changed: #messageCategoryList.
	self changed: #messageList.
	self changed: #relabel.
	self changed: #selectedSystemCategoryName.
	self contentsChanged