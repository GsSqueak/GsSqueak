class list
classIconAt: anIndex

	self class showClassIcons
		ifFalse: [^ nil].

	^ ToolIcons iconNamed: (ToolIcons iconForClass: (self classList at: anIndex) withBlanksTrimmed asSymbol)