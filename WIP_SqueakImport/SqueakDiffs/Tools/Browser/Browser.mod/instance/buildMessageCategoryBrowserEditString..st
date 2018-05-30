message category functions
buildMessageCategoryBrowserEditString: aString 
	"Create and schedule a new class browser for the current selection,
	with initial textual contents set to aString. This is used specifically in
	spawning where a class is established but a method-category is not."
	^  self hasMessageCategorySelected ifTrue: [Browser
		newOnClass: self selectedClassOrMetaClass
		messageCategory:  self selectedMessageCategoryName
		selector: self selectedMessageName
		editString: aString
		label: 'Message category Browser: ' , self selectedClassOrMetaClass name , self categoryOfCurrentMethod]