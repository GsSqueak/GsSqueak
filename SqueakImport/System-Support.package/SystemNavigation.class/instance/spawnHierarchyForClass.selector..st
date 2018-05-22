browse
spawnHierarchyForClass: aClass selector: aSelector
	"Create and schedule a new class hierarchy browser on the requested class/selector."
	"SystemNavigation default spawnHierarchyForClass: SmallInteger selector: #hash"

	(aClass == nil)  ifTrue: [^ self].
	^ ToolSet browseHierarchy: aClass selector: aSelector
