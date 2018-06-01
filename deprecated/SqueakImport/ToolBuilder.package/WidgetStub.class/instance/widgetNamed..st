accessing
widgetNamed: aString
	^ self name = aString 
		ifTrue: [self]
		ifFalse: [nil]