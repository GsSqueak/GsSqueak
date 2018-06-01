accessing
like: anObject
	"Answer an object in the receiver that is equal to anObject,
	nil if no such object is found. Relies heavily on hash properties"

	^(array at: (self scanFor: (keyBlock value: anObject)))
		ifNotNil: [ :element | element enclosedSetElement]