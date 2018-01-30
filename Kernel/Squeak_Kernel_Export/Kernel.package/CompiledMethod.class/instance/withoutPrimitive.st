converting
withoutPrimitive
	"Answers a copy of self without primitive call.
	That may serve for example for testing fallback code."
	
	| copy skipPrimitiveCall |
	self primitive = 0 ifTrue: [^self].
	skipPrimitiveCall := 3.
	copy := CompiledMethod 
		newMethod: self basicSize - self initialPC + 1 - skipPrimitiveCall
		header: (self header bitClear: 16r10000).
	1 to: self numLiterals do: [:index| copy literalAt: index put: (self literalAt: index)].
	self initialPC + skipPrimitiveCall to: self size do: [:index | copy at: index - skipPrimitiveCall put: (self at: index)].
	copy postCopy.
	^copy