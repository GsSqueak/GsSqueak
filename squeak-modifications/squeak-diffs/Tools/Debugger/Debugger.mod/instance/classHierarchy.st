toolbuilder
classHierarchy
	"Create and schedule a class list browser on the receiver's hierarchy."
	(self selectedMessageName = #doesNotUnderstand: and: [ self selectedClassOrMetaClass = Object ])
		ifTrue:
			[ self systemNavigation
				spawnHierarchyForClass: self receiverClass
				selector: self selectedMessageName ]
		ifFalse: [ super classHierarchy ]