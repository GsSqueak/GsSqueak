object access primitives
primitiveNewWithArg
	"Allocate a new indexable instance. Fail if the allocation would leave less than lowSpaceThreshold bytes free."
	| size class spaceOkay |
	<var: #size type: 'usqInt'>

	self isDefinedTrueExpression: 'SQ_IMAGE64 && SQ_HOST64'
		inSmalltalk: [objectMemory bytesPerWord = 8]
		comment: 'permit large object allocation on 64 bit image and host'
		ifTrue: [size := self positive64BitValueOf: self stackTop]
		ifFalse: [size := self positive32BitValueOf: self stackTop].
	class := self stackValue: 1.
	self success: size >= 0.
	self successful
		ifTrue: ["The following may cause GC!"
			spaceOkay := self sufficientSpaceToInstantiate: class indexableSize: size.
			self success: spaceOkay.
			class := self stackValue: 1].
	self successful ifTrue: [self pop: 2 thenPush: (objectMemory instantiateClass: class indexableSize: size)]