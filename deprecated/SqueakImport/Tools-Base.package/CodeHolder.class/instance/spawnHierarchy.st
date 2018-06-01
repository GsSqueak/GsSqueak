traits
spawnHierarchy
	"Create and schedule a new hierarchy browser on the currently selected class or meta."

	^ ToolSet
		browseHierarchy: self selectedClassOrMetaClass
		selector: self selectedMessageName