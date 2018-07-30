toolbuilder
getUserInput

	ToolBuilder open: self.
	^ self cancelled
		ifTrue: [	nil]
		ifFalse: [self]