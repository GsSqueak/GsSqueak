enumerating
intersection: aCollection
	(self species = aCollection species or: [aCollection isString or: [aCollection allSatisfy: [:e | e isCharacter]]]) ifFalse: [^super intersection: aCollection].
	^self class including: [:c | (aCollection includes: c) and: [block value: c]]
