system category functions
findClass
	"Search for a class by name."

	| foundClass |
	(self multiWindowState notNil
	 or: [self okToChange]) ifFalse:
		[^self classNotFound].
	foundClass := UIManager default chooseClassOrTraitFrom: self environment.
	foundClass ifNil: [^self classNotFound].
	(self selectedClass notNil
	 and: [self multiWindowState notNil
	 "Can only support multi-window if original window has all the right panes."
	 and: [self multiWindowState prototype isHierarchy not]]) ifTrue:
		[(self classList includes: foundClass name)
			ifTrue: [self multiWindowState copyWindow]
			ifFalse: [self multiWindowState addNewWindow]].
 	self selectCategoryForClass: foundClass.
	self selectClass: foundClass