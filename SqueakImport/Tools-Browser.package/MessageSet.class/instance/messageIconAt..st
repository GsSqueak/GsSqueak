message list
messageIconAt: anIndex

	Browser showMessageIcons
		ifFalse: [^ nil].

	^ ToolIcons iconNamed: (ToolIcons
		iconForClass: (self messageList at: anIndex) actualClass
		selector: (self messageList at: anIndex) selector)