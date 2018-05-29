commands
spawnToClass: aClass
	"Used to copy down code from a superclass to a subclass in one easy step, if you know what you're doing.  Spawns a new message-category browser for the indicated class, populating it with the source code seen in the current tool."

	self categoryOfCurrentMethod
		ifNil: [
			self buildClassBrowserEditString: self contents]
		ifNotNil: [:category |
			self
				buildMessageCategoryBrowserForCategory: category
				class: aClass
				selector: nil
				editString: self contents]