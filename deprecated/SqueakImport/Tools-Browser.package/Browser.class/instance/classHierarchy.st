multi-window support
classHierarchy
	| behavior newBrowser |
	(behavior := self selectedClassOrMetaClass) isNil ifTrue:
		[^self].

	(self isPackage "PackageBrowser pains can't support a hierarchy browser; not sure why."
	 or: [self multiWindowState isNil]) ifTrue:
		[^super classHierarchy].

	(newBrowser := HierarchyBrowser new initHierarchyForClass: behavior)
		selectMessageCategoryNamed: self selectedMessageCategoryName;
		selectMessageNamed: self selectedMessageName;
		editSelection: editSelection.

	self multiWindowState addWindow: newBrowser
