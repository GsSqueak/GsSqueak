class functions
editClass
	"Retrieve the description of the class definition."

	self hasClassSelected ifFalse: [^ self].
	self okToChange ifFalse: [^ self].
	self messageCategoryListIndex: 0.
	self editSelection: #editClass.
	self changed: #contents.
	self changed: #classCommentText.
