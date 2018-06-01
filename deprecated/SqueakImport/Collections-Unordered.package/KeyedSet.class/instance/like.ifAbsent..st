accessing
like: anObject ifAbsent: aBlock
	"Answer an object in the receiver that is equal to anObject,
	or evaluate the block if not found. Relies heavily on hash properties"

	^(array at: (self scanFor: (keyBlock value: anObject)))
		ifNil: [ aBlock value ]
		ifNotNil: [ :element | element enclosedSetElement ]