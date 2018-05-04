other primitives
primitiveIsBigEnder
	"Answer true if running on a big endian machine."
	<export: true>
	self isBigEnder
		ifTrue: [self pop: 1 thenPush: objectMemory trueObject]
		ifFalse: [self pop: 1 thenPush: objectMemory falseObject]
	