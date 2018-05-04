indexing primitives
primitiveContextAtPut
	| index value aContext spouseFP hdr fmt totalLength fixedFields stSize |
	<var: #spouseFP type: #'char *'>
	value := self stackTop.
	index := self stackValue: 1.
	aContext := self stackValue: 2.
	(objectMemory isIntegerObject: index) ifFalse:
		[^self primitiveFail].
	"Duplicating much of stObject:at:put: here allows stObject:at:put: to omit tests for contexts."
	hdr := objectMemory baseHeader: aContext.
	index := objectMemory integerValueOf: index.
	(self isContextHeader: hdr) ifFalse: "might be an instance of a subclass"
		[self stObject: aContext at: index put: value.
		 ^self pop: 3 thenPush: value].
	self externalWriteBackHeadFramePointers.
	(self isStillMarriedContext: aContext) ifFalse:
		[fmt := objectMemory formatOfHeader: hdr.
		 totalLength := objectMemory lengthOf: aContext baseHeader: hdr format: fmt.
		 fixedFields := objectMemory fixedFieldsOf: aContext format: fmt length: totalLength.
		 stSize := self stackPointerForMaybeMarriedContext: aContext.
		 (index between: 1 and: stSize) ifFalse:
			[^self primitiveFail].			
		self subscript: aContext with: (index + fixedFields) storing: value format: fmt.
		^self pop: 3 thenPush: value].
	spouseFP := self frameOfMarriedContext: aContext.
	(index between: 1 and: (self stackPointerIndexForFrame: spouseFP)) ifFalse:
		[^self primitiveFail].
	self temporary: index - 1 in: spouseFP put: value.
	^self pop: 3 thenPush: value