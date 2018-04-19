*SqCollectionLiterals-*SqCollectionLiterals-bindings
beReadWriteBindingAnnouncing: aBool
	"Make the receiver (a global read-write binding) be a read-write binding"
	^self beBindingOfType: Association announcing: aBool
