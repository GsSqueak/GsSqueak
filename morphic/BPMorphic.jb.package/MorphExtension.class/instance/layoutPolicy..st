accessing - layout properties
layoutPolicy: aLayoutPolicy 	aLayoutPolicy isNil		ifTrue: [self removeProperty: #layoutPolicy]		ifFalse: [self setProperty: #layoutPolicy toValue: aLayoutPolicy]