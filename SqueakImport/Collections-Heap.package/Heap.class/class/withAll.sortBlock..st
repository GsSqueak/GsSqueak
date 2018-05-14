instance creation
withAll: aCollection sortBlock: sortBlock
	"Create a new heap with all the elements from aCollection, sorted by sortBlock"
	
	| array |
	array := aCollection asArray.
	array == aCollection ifTrue: [ array := array copy ].
	^self on: array size: array size sortBlock: sortBlock