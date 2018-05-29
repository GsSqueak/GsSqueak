event handling
handlesMouseDown: evt
	^evt yellowButtonPressed
		or: [super handlesMouseDown: evt]