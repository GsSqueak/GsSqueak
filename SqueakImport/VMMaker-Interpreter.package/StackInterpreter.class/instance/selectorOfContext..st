debug printing
selectorOfContext: aContext
	(self isContext: aContext) ifFalse:
		[^nil].
	^self
		findSelectorOfMethod: (objectMemory fetchPointer: MethodIndex ofObject: aContext)
		forReceiver:  (objectMemory fetchPointer: ReceiverIndex ofObject: aContext)