container protocol
toggleExpandedState

	self isExpanded
		ifTrue: [self collapse]
		ifFalse: [self expand].