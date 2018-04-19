*SqCollectionLiterals-*SqCollectionLiterals-bindings
beReadOnlyBindingAnnouncing: aBool
	"Make the receiver (a global read-write binding) be a read-only binding"
	^self beBindingOfType: ReadOnlyVariableBinding announcing: aBool
