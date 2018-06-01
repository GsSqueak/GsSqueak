commands
spawn: aString 
	"Create and schedule a spawned message category browser for the currently selected message category.  The initial text view contains the characters in aString.  In the spawned browser, preselect the current selector (if any) as the going-in assumption, though upon acceptance this will often change"

	self selectedClassOrMetaClass
		ifNil: [
			^ aString isEmptyOrNil ifFalse: [(Workspace new contents: aString) openLabel: 'spawned workspace']]
		ifNotNil: [:cls |
			self categoryOfCurrentMethod
				ifNil: [
					self buildClassBrowserEditString: aString]
				ifNotNil: [:category |
					self
						buildMessageCategoryBrowserForCategory: category
						class: cls
						selector: self selectedMessageName
						editString: aString]]