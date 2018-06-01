package list
packageListIndex: anInteger 
	"Set anInteger to be the index of the current package selection."

	packageListIndex := anInteger.
	anInteger = 0
		ifFalse: [package := self packageList at: packageListIndex].
	selectedMessageCategoryName := nil.
	self selectSystemCategory: nil.
	selectedMessageName := nil.
	selectedClassName := nil.
	self setClassOrganizer.
	self changed: #packageSelectionChanged.
	self changed: #packageListIndex.	"update my selection"
	self changed: #systemCategoryList.	"update the category list"
	self selectSystemCategory: nil.	"update category list selection"
