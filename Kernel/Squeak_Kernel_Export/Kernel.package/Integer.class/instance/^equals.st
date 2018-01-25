comparing
= aNumber

	aNumber class == self class ifTrue: [ ^(self digitCompare: aNumber) = 0 ].
	aNumber isInteger ifTrue: [ ^false ].
	aNumber isNumber ifFalse: [ ^false ].
	^aNumber adaptToInteger: self andCompare: #=