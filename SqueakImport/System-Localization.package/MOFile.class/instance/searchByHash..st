experimental
searchByHash: aString
	| hashValue nstr index incr key |
	hashValue :=  self hashPjw: aString.
	incr := 1 + (hashValue \\ (hashTableSize -2)).
	index := (hashValue \\ hashTableSize) .
	[ 	nstr := (hashTable at: index +1 ).
		nstr = 0 ifTrue: [^nil].
		key := self originalString: nstr.
		key = aString ifTrue: [^self translatedString: nstr].
		index >= (hashTableSize - incr) 
				ifTrue: [index := index - (hashTableSize - incr)  ]
				ifFalse:[index := index + incr].	
	] doWhileTrue: true.