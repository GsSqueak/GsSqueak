accessing
upTo: anObject
	"fast version using indexOf:"

	| start end |
	isBinary
		ifTrue: [ anObject isInteger ifFalse: [ ^self upToEnd ] ]
		ifFalse: [ anObject isCharacter ifFalse: [ ^self upToEnd ] ].
	start := position + 1.
	end := collection indexOf: anObject asCharacter startingAt: start.
	"not present--return rest of the collection"	
	(end = 0 or: [end > readLimit]) ifTrue: [ ^self upToEnd ].
	"skip to the end and return the data passed over"
	position := end.
	^((isBinary ifTrue: [ ByteArray ] ifFalse: [ String ]) new: end - start)
		replaceFrom: 1
		to: end - start
		with: collection
		startingAt: start