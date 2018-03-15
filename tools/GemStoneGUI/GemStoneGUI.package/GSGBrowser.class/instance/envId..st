environments
envId: anInteger

	anInteger = envId ifTrue: [^ self].
	envId := anInteger.
		
	selectedClassName := nil.
	selectedMessageCategoryName := nil.
	selectedMessageName := nil.
	self editSelection: (selectedSystemCategory 
							ifNil: [#none]
							ifNotNil: [#newClass]).
	metaClassIndicated := false.
	self setClassOrganizer.
	contents := nil.
	self changed: #systemCategorySelectionChanged.
	self changed: #systemCategoryListIndex.	"update my selection"
	self changed: #classList.
	self changed: #messageCategoryList.
	self changed: #messageList.
	self changed: #instanceMessagesIndicated.
	self changed: #classMessagesIndicated.
	self changed: #relabel.
	self contentsChanged
	
	