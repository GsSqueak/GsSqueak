construction
buildClassBrowserEditString: classDefinition 
	"Create and schedule a new class browser for the current selection, with initial textual contents set to aString.  This is used specifically in spawning where a class is established but a method-category is not."

	self flag: #uglyHack. "mt: We should not abuse Browser like this. We should not even know about #Browser in this superclass."
	^(Browser
		newOnClass: self selectedClassOrMetaClass
		editString: classDefinition
		label: 'Class Browser: ', self selectedClassOrMetaClass name)
			editSelection: #editClass; "...because we know it is class def code."
			changed: #editString with: classDefinition; "...trigger re-styling."
			yourself
