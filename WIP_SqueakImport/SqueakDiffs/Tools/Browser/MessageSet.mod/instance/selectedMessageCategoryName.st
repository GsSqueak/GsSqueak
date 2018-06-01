class list
selectedMessageCategoryName 
	"Answer the name of the selected message category or nil."
	| cls |
	self hasMessageSelected ifFalse: [^ nil].
	cls := self selectedClassOrMetaClass.
	
	cls ifNil: [^ nil].
	
	^ cls organization categoryOfElement: self selectedMessageName