system category list
findClass
	"Search for a class by name."

	| foundClass classList |
	(self multiWindowState notNil
	 or: [self okToChange]) ifFalse:
		[^self classNotFound].
	classList := self classList.
	foundClass := UIManager default chooseFrom: classList values: classList.
	foundClass ifNil: [^self classNotFound].
	(self selectedClassName notNil
	 and: [self multiWindowState notNil
	 "Can only support multi-window if original window has all the right panes."
	 and: [self multiWindowState prototype isHierarchy not]]) ifTrue:
		[(classList includes: foundClass)
			ifTrue: [self multiWindowState copyWindow]
			ifFalse: [self multiWindowState addNewWindow]].
 	self selectCategoryForClass: foundClass.
	self selectClassNamed: foundClass