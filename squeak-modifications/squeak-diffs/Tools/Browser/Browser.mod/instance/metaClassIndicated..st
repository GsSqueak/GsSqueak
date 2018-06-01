metaclass
metaClassIndicated: trueOrFalse 
	"Indicate whether browsing instance or class messages."

	metaClassIndicated := trueOrFalse.
	self setClassOrganizer.
	self hasSystemCategorySelected ifTrue:
		[self editSelection: (self hasClassSelected
			ifFalse: [metaClassIndicated
				ifTrue: [#none]
				ifFalse: [#newClass]]
			ifTrue: [#editClass])].
	selectedMessageCategoryName := nil.
	selectedMessageName := nil.
	contents := nil.
	self changed: #classSelectionChanged.
	self changed: #messageCategoryList.
	self changed: #messageList.
	self changed: #contents.
	self changed: #annotation.
	self decorateButtons
