class list
selectClassNamed: aSymbolOrString
	| className currentMessageCategoryName currentMessageName |

	currentMessageCategoryName := [self selectedMessageCategoryName]
										on: Error
										do: [:ex| ex return: nil].
	currentMessageName := [self selectedMessageName]
								on: Error
								do: [:ex| ex return: nil].
								
	selectedClassName := aSymbolOrString ifNotNil: [ aSymbolOrString asSymbol ].
	self setClassOrganizer.
	self setClassDefinition.

	"Try to reselect the category and/or selector if the new class has them."
	selectedMessageCategoryName :=(self messageCategoryList includes: currentMessageCategoryName)
		ifTrue: [currentMessageCategoryName]
		ifFalse: [nil].
	selectedMessageName := (self messageList includes: currentMessageName)
		ifTrue: [currentMessageName]
		ifFalse: [nil].

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
	self selectedClass isNil
		ifFalse: [className := self selectedClass name.
					(RecentClasses includes: className)
				ifTrue: [RecentClasses remove: className].
			RecentClasses addFirst: className.
			RecentClasses size > 16
				ifTrue: [RecentClasses removeLast]].
	self changed: #classSelectionChanged.
	self changed: #classCommentText.
	self changed: #classListIndex.	"update my selection"
	self changed: #messageCategoryList.
	self changed: #messageList.
	self changed: #relabel.
	self changed: #selectedSystemCategoryName.
	self contentsChanged