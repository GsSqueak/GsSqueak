actions & preps
polyEditing: aBool 
	aBool
		ifTrue: [self setProperty: #polyEditing toValue: aBool]
		ifFalse: [self removeProperty: #polyEditing]