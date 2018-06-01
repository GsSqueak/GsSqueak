class functions
hierarchy
	"Display the inheritance hierarchy of the receiver's selected class."

	self hasClassSelected ifFalse: [^ self].
	self okToChange ifFalse: [^ self].
	self messageCategoryListIndex: 0.
	self editSelection: #hierarchy.
	self changed: #editComment.
	self contentsChanged.
	^ self