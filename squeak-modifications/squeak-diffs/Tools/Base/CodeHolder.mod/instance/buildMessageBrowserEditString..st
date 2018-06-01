construction
buildMessageBrowserEditString: aString 
	"Create and schedule a new message browser for the current selection,
	with initial textual contents set to aString."
	^ Browser
		newOnClass: self selectedClassOrMetaClass
		messageCategory: self categoryOfCurrentMethod
		selector: self selectedMessageName
		editString: aString
		label: 'Message Browser: ' , self selectedClassOrMetaClass name , self categoryOfCurrentMethod