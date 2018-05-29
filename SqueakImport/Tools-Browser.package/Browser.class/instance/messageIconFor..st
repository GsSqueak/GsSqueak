message list
messageIconFor: aSelector 

	self class showMessageIcons ifFalse: [^ nil].

	^ ToolIcons iconNamed: (ToolIcons
		iconForClass: self selectedClassOrMetaClass
		selector: aSelector)