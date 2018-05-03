indexing primitives
primitiveContextAt
	| index value aContext spouseFP hdr fmt totalLength fixedFields stSize |
	<var: #spouseFP type: #'char *'>
	index := self stackTop.
	(objectMemory isIntegerObject: index) ifFalse:
		[^self primitiveFail].
	index := objectMemory integerValueOf: index.
	aContext := self stackValue: 1.
	"Duplicating much of stObject:at:put: here allows stObject:at:put: to omit tests for contexts."
	hdr := objectMemory baseHeader: aContext.
	(self isContextHeader: hdr) ifFalse: "might be an instance of a subclass"
		[value := self stObject: aContext at: index.
		 ^self pop: 2 thenPush: value].
	self externalWriteBackHeadFramePointers.
	(self isStillMarriedContext: aContext) ifFalse:
		[fmt := objectMemory formatOfHeader: hdr.
		 totalLength := objectMemory lengthOf: aContext baseHeader: hdr format: fmt.
		 fixedFields := objectMemory fixedFieldsOf: aContext format: fmt length: totalLength.
		 stSize := self stackPointerForMaybeMarriedContext: aContext.
		 (index between: 1 and: stSize) ifFalse:
			[^self primitiveFail].			
		value := self subscript: aContext with: (index + fixedFields) format: fmt.
		^self pop: 2 thenPush: value].
	spouseFP := self frameOfMarriedContext: aContext.
	(index between: 1 and: (self stackPointerIndexForFrame: spouseFP)) ifFalse:
		[^self primitiveFail].
	value := self temporary: index - 1 in: spouseFP.
	self pop: 2 thenPush: value