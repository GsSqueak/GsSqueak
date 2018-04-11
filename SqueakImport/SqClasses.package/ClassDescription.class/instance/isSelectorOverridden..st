*SqClasses-testing
isSelectorOverridden: aSelector

	(self includesSelector: aSelector)
		ifFalse: [^ false].
		
	self allSubclassesDo: [ :class |
		(class includesSelector: aSelector)
			ifTrue: [ ^ true ] ].
	^ false
