enumerating
union: aCollection
	(self isCharacters: aCollection) ifFalse: [^super union: aCollection].
	(self species = aCollection species and: [self class ~= aCollection class]) ifTrue: [^aCollection union: self].
	^self copy addAll: aCollection; yourself