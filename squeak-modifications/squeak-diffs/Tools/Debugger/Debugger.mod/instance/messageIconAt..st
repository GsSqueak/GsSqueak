context stack (message list)
messageIconAt: anIndex

	Browser showMessageIcons
		ifFalse: [^ nil].

	^ ToolIcons iconNamed: (ToolIcons
		iconForClass: (contextStack at: anIndex) method methodClass
		selector: (contextStack at: anIndex) method selector)