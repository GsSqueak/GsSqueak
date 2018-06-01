-Tools
classHierarchy
	"Create and schedule a class list browser on the receiver's hierarchy."
	self systemNavigation spawnHierarchyForClass: self selectedClassOrMetaClass selector: self selectedMessageName
	"OK if nil"