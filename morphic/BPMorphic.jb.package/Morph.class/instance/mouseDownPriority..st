events-processing
mouseDownPriority: anInteger 	anInteger = 0		ifTrue: [^ self removeProperty: #mouseDownPriority].	self setProperty: #mouseDownPriority toValue: anInteger