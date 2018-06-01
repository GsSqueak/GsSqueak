message category functions
editMessageCategories
	"Indicate to the receiver and its dependents that the message categories of 
	the selected class have been changed."

	self okToChange ifFalse: [^ self].
	self hasClassSelected
		ifTrue: 
			[self messageCategoryListIndex: 0.
			self editSelection: #editMessageCategories.
			self changed: #editMessageCategories.
			self contentsChanged]