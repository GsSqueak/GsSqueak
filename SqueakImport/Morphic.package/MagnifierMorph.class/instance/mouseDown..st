event handling
mouseDown: evt
	evt yellowButtonPressed
		ifTrue: [self chooseMagnification: evt]
		ifFalse: [super mouseDown: evt]