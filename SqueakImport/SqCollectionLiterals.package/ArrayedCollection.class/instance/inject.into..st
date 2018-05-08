enumerating
inject: anObject into: aBlock
	"Optimized for speed. See super."
	
	| result |
	result := anObject.
	1 to: self size do: [:i | result := aBlock value: result value: (self at: i)].
	^result
