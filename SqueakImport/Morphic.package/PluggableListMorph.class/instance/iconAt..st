model access
iconAt: anInteger

	| index |
	index := (self hasFilter and: [list notNil])
		ifTrue: [self getFullList indexOf: (list at: anInteger ifAbsent: [^nil])]
		ifFalse: [anInteger].
	^ getIconSelector ifNotNil: [model perform: getIconSelector with: index]