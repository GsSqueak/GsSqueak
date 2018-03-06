code generation
selectorNode
	"Answer a SelectorNode for the message selector of the method
	represented by the receiver."
	^ (selectorOrFalse isKindOf: SqSelectorNode)
		ifTrue: [selectorOrFalse]
		ifFalse: [SqSelectorNode new key: selectorOrFalse]