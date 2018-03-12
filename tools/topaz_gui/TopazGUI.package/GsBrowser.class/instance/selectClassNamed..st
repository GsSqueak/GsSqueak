class list
selectClassNamed: aSymbolOrString

	selectedClassName := aSymbolOrString ifNotNil: [ aSymbolOrString asSymbol ].
	"Try to reselect the category and/or selector if the new class has them."
	(self messageCategoryList includes: selectedMessageCategoryName) ifFalse: [selectedMessageCategoryName := nil].
	(self messageList includes: selectedMessageName) ifFalse: [selectedMessageName := nil].

	self changed: #classListIndex.	"update my selection"
	self changed: #messageCategoryList.
	self changed: #messageList.
	self changed: #relabel