accessing - layout properties
layoutFrame: aLayoutFrame 	aLayoutFrame isNil		ifTrue: [self removeProperty: #layoutFrame]		ifFalse: [self setProperty: #layoutFrame toValue: aLayoutFrame]