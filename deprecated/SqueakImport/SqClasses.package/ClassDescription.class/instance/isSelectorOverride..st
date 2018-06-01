*SqClasses-testing
isSelectorOverride: aSelector

	(self includesSelector: aSelector)
		ifFalse: [^ false].

	self allSuperclassesDo: [ :class | 
		(class includesSelector: aSelector) 
			ifTrue: [ ^ true ] ].
	^ false
