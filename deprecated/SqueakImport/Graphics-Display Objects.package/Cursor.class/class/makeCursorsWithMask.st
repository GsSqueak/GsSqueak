class initialization
makeCursorsWithMask
	"Cursor initialize;makeCursorsWithMask"

	self classPool associationsDo: [:var |
		((var value isKindOf: Cursor) and:[var value hasMask not])
			ifTrue: [var value: var value withMask]]