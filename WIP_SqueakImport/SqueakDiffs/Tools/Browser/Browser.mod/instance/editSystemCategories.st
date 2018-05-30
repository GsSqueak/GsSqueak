system category functions
editSystemCategories
	"Retrieve the description of the class categories of the system organizer."

	self okToChange ifFalse: [^ self].
	self selectSystemCategory: nil.
	self editSelection: #editSystemCategories.
	self changed: #editSystemCategories.
	self contentsChanged